dockerEnvironment = "osaamiskiekko"
compose = "docker-compose --project-directory . -p ${dockerEnvironment}"
projectName = "partionosaamiskiekko"
dockerRepository = "artifactory.dev.eficode.io"
dockerFrontendImage = "${dockerRepository}/${projectName}/${dockerEnvironment}/frontend_${env.BRANCH_NAME}"
dockerBackendImage = "${dockerRepository}/${projectName}/${dockerEnvironment}/backend_${env.BRANCH_NAME}"
taggedFrontendImage = dockerFrontendImage
taggedBackendImage = dockerBackendImage

publishedBranches = [ "master", "test", "staging", "production"]

pipeline {
  agent {
    label 'tabletkoulu'
  }
  
  environment {
    DOCKER_HOST = 'tcp://127.0.0.1:2375'
    COMPOSE_HTTP_TIMEOUT = 1000
    GCLOUD_PROJECT = "osaamiskiekko"
    GCLOUD_RESOURCE_PREFIX = "osaamiskiekko"
    GCLOUD_REGION = "europe-north1"
    GCLOUD_ZONE = "europe-north1-a"
    GCLOUD_PARAM = "--zone ${env.GCLOUD_ZONE}"
    GCLOUD_CLUSTER = "osaamiskiekko-dev-cluster"
    GCLOUD_DB_PROXY_USERNAME = "proxy-user@osaamiskiekko.iam.gserviceaccount.com"
    DATABASE_INSTANCE_ID = "osaamiskiekko-dev-db"
    DATABASE_CREDENTIALS_ID = "${env.BRANCH_NAME == "production" ? "database-credentials-production" : "database-credentials-dev"}"    
  }

  options {
    timeout(time: 20, unit: 'MINUTES')
  }

  stages {
    // stage('Checkout') {
    //   steps {
    //     notifyBuild('STARTED')
    //     checkout scm
    //   }
    // }
  
    stage('Cloud init') {
      when {
        expression {
          return publishedBranches.contains(env.BRANCH_NAME);
        }
      }
              
      steps {
        script {
          env.NAMESPACE = cleanBranchNameForNamespace(env.BRANCH_NAME)
        }

        withCredentials([file(credentialsId: 'osaamiskiekko-google-service-account-credentials', variable: 'credfile')]) {
          sh "gcloud auth activate-service-account --key-file \$credfile"
          sh "rm \$credfile"
          sh "gcloud config set project ${env.GCLOUD_PROJECT}"
          sh "gcloud container clusters get-credentials ${env.GCLOUD_CLUSTER} ${env.GCLOUD_PARAM}"
          sh "kubectl get pods" // just testing connection first
          sh """kubectl create namespace ${env.NAMESPACE} \
          --dry-run -o yaml \
          | kubectl apply -f -"""
          
          // Create database
          sh "gcloud sql databases create ${env.GCLOUD_RESOURCE_PREFIX}-${env.NAMESPACE} -i ${env.DATABASE_INSTANCE_ID} || true"

          withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "${env.DATABASE_CREDENTIALS_ID}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
            echo env.BRANCH_NAME
            echo "${env.BRANCH_NAME == "production" ? "database-credentials-production" : "database-credentials-dev"}"
            echo env.DATABASE_CREDENTIALS_ID
            sh "gcloud sql users create $USERNAME --password=$PASSWORD -i ${env.DATABASE_INSTANCE_ID} || true"
          }
          
          // Create database proxy credentials secret
          withCredentials([file(credentialsId: 'osaamiskiekko-google-cloudsql-proxy-credentials', variable: 'proxycredfile')]) {
            sh """kubectl create secret generic cloudsql-instance-credentials \
            --from-file=credentials.json=\$proxycredfile \
            -n ${env.NAMESPACE} \
            --dry-run -o yaml \
              | kubectl apply -f -"""
            sh "rm \$proxycredfile"
          }

          // Create or update docker registry credentials secret
          withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'partionosaamiskiekko-bot-w_password',
            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
            sh """kubectl create secret docker-registry eficode-artifactory-cred \
              --docker-server=${dockerRepository} \
              --docker-username=$USERNAME \
              --docker-password=$PASSWORD \
              --docker-email=partionosaamiskiekko-bot@rum.invalid \
              -n ${env.NAMESPACE} \
              --dry-run -o yaml \
              | kubectl apply -f -"""

            sh """kubectl patch serviceaccount default \
              -p \"{\\\"imagePullSecrets\\\": [{\\\"name\\\": \\\"eficode-artifactory-cred\\\"}]}\" \
              -n ${env.NAMESPACE}"""
          }
          // Create or update database credentials secret
          withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "${env.DATABASE_CREDENTIALS_ID}",
            usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
            sh """kubectl create secret generic database-credentials \
              --from-literal=username='$USERNAME' \
              --from-literal=password='$PASSWORD' \
              --from-literal=dbname='${GCLOUD_RESOURCE_PREFIX}-${env.NAMESPACE}' \
              -n ${env.NAMESPACE} \
              --dry-run -o yaml \
              | kubectl apply -f -"""
          }

          // Create cloud storage bucket and service account for Uploads
          // NOTE: Bucket storage had to be configured manually in Strapi UI
          sh """
            gcloud beta iam service-accounts create \
              ${env.NAMESPACE}-namespace-storage-account \
              --description 'For ${env.NAMESPACE} environment StrapiCMS uploads plugin' \
              --display-name '${env.NAMESPACE}-namespace-storage-account' \
              || true"""

          sh "gsutil mb -c regional -l ${env.GCLOUD_REGION} -p ${env.GCLOUD_PROJECT} gs://${GCLOUD_RESOURCE_PREFIX}-${env.NAMESPACE} || true"

          sh """gsutil acl ch \
            -u ${env.NAMESPACE}-namespace-storage-account@${env.GCLOUD_PROJECT}.iam.gserviceaccount.com:WRITE \
            gs://${GCLOUD_RESOURCE_PREFIX}-${env.NAMESPACE} \
            || true"""

          sh "gcloud auth configure-docker"
        }
      }
    }

    stage('Build') {
      steps {
        buildImages()
      }
    }

    stage('Front-End unit tests') {
      steps {
        sh """${compose} \
            -f compose/frontend-unittests.yml \
            up"""
      }

      post {
        always {
          sh """${compose} \
            -f compose/frontend-unittests.yml \
            logs >unit-test.log"""
          
          archiveArtifacts 'unit-test.log'

          sh """${compose} \
            -f compose/frontend-unittests.yml \
            down"""
        }
      }
    }

    stage('Static code analysis') {
      steps {
        withSonarQubeEnv('SonarQube') {
          script {
              scannerHome = tool 'SonarScanner'
          }

          // Copy write-protected (root-owned) test+coverage results to a new location
          sh "mkdir frontend/coverage"
          sh "cp frontend/test-results/* frontend/coverage -r"
          // Rewrite container paths -> jenkins paths in the results (sonar ignores non-matching files)
          sh "sed s#/usr/src/app#${pwd()}/frontend#g -i frontend/coverage/lcov.info"
          sh "sed s#/usr/src/app#${pwd()}/frontend#g -i frontend/coverage/sonar-report.xml"

          archiveArtifacts 'frontend/coverage/lcov.info*'
          archiveArtifacts 'frontend/coverage/sonar-report.xml*'

          sh "${scannerHome}/bin/sonar-scanner -Dsonar.branch=${env.BRANCH_NAME}"
        }
      }
    }

    stage('Acceptance Test') {
      steps {
        script {
            sh """${compose} \
              -f docker-compose.yml \
              -f compose/frontend.yml \
              -f compose/robot.yml \
              run robot"""
        }
      }

      post {
        always {
          step([$class: 'RobotPublisher',
              disableArchiveOutput: false,
              logFileName: 'results/robot/log.html',
              onlyCritical: true,
              otherFiles: 'results/robot/*.png',
              outputFileName: 'results/robot/output.xml',
              outputPath: '.',
              passThreshold: 90,
              reportFileName: 'results/robot/report.html',
              unstableThreshold: 100]);

          sh """${compose} \
            -f docker-compose.yml \
            -f compose/frontend.yml \
            -f compose/robot.yml \
            logs >acceptance-test.log"""
          
          archiveArtifacts artifacts: 'acceptance-test.log', fingerprint: true

          sh """${compose} \
            -f docker-compose.yml \
            -f compose/frontend.yml \
            -f compose/robot.yml \
            down -v"""
        }
      }
    }

    stage('Push to Artifactory') {
      when {
        expression {
          return publishedBranches.contains(env.BRANCH_NAME);
        }
      }
      steps {
        script {
          env.WORKSPACE = pwd()
        }
        script {
          if (env.BRANCH_NAME == 'production') {
            env.VERSION = sh (script: """
              docker run -v \"${env.WORKSPACE}/package.json:/tmp/package.json\" node:alpine node -p \"require(\'/tmp/package.json\').version\"
              """,
            returnStdout: true).trim()
          } else {
            env.VERSION =   "${env.GIT_COMMIT}".substring(32)
          }

          echo env.VERSION
        }

        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'partionosaamiskiekko-bot-w_password',
          usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {

          sh "docker login ${dockerRepository} -u $USERNAME -p $PASSWORD"

          labelAndPush(env.VERSION)
        }
      }
    }
 
    stage('Deploy') {
      when {
        expression {
          return publishedBranches.contains(env.BRANCH_NAME);
        }
      }
      steps {
        script {
          env.WORKSPACE = pwd()
          env.SUBDOMAIN = env.NAMESPACE

          if (env.BRANCH_NAME == 'production') {
            env.SUBDOMAIN = 'www'
          } else if (env.BRANCH_NAME == 'master') {
            env.SUBDOMAIN = 'dev'
          } 
        }
        
        script {
          nodeEnv = 'development'
          if (env.BRANCH_NAME == 'production') {
            nodeEnv = 'production'
          } else if (env.BRANCH_NAME == 'staging') {
            nodeEnv = 'staging'
          }

          sh """sed -i \
          -e 's#\$BACKENDIMAGE#${taggedBackendImage}#g; \
              s#\$FRONTENDIMAGE#${taggedFrontendImage}#g; \
              s#\$PHASE#${env.NAMESPACE}#g; \
              s#\$SUBDOMAIN#${env.SUBDOMAIN}#g; \
              s#\$NODE_ENV#${nodeEnv}#g' \
          ./kubectl/*.yaml"""

          archiveArtifacts artifacts: 'kubectl/**/*.yaml', fingerprint: true
          
          sh "kubectl apply -n ${env.NAMESPACE} -f kubectl/backend.yaml"
          sh "kubectl apply -n ${env.NAMESPACE} -f kubectl/backend-service.yaml"
          sh "kubectl apply -n ${env.NAMESPACE} -f kubectl/frontend.yaml"
          sh "kubectl apply -n ${env.NAMESPACE} -f kubectl/namespace-ingress.yaml"

          if (env.BRANCH_NAME == 'production') {
            sh "kubectl apply -n ${env.NAMESPACE} -f kubectl/no-host-namespace-ingress.yaml" 
          }
        }
      }
    }
  }

  post {
    always {
      notifyBuild(currentBuild.result)
      // TODO: Enable unit test archival
      // step([$class: 'JUnitResultArchiver', testResults: 'results/mocha/test-results.xml'])
    }
  }
}

def cleanBranchNameForNamespace(branchname) {
    String namespaceCandidate = branchname ? branchname.split(/_.*/)[0] : '';
    String namespace = namespaceCandidate.replaceAll("[^a-zA-Z0-9\\-]","").toLowerCase()
    if (namespace[0].isNumber()) {
      namespace='n'+namespace;
    }
    print "Namespace is set "
    println namespace
    return namespace
}

def buildImages() {
  sh """${compose} \
    -f docker-compose.yml \
    -f compose/frontend.yml \
    build --pull backend db frontend"""
}

def labelAndPush(version) {
  tagImages(version)
  pushToDockerhub(version)
}

def tagImages(version) {
  sh "docker tag ${dockerEnvironment}_frontend ${dockerFrontendImage}:latest"
  sh "docker tag ${dockerEnvironment}_backend ${dockerBackendImage}:latest"

  sh "docker tag ${dockerEnvironment}_frontend ${taggedFrontendImage}:${version}"
  sh "docker tag ${dockerEnvironment}_backend ${taggedBackendImage}:${version}"

  taggedFrontendImage = "${dockerFrontendImage}:${version}"
  taggedBackendImage = "${dockerBackendImage}:${version}"  
}

def pushToDockerhub(version) {
  sh "docker push ${dockerFrontendImage}:latest"
  sh "docker push ${dockerBackendImage}:latest"

  sh "docker push ${taggedFrontendImage}"
  sh "docker push ${taggedBackendImage}"
}

def notifyBuild(String buildStatus = 'STARTED') {
  try {
    withCredentials([string(credentialsId: 'slacktoken', variable: 'TOKEN')]) { 
      def slackURL = "https://eficode.slack.com/services/hooks/jenkins-ci/$TOKEN"
      
      sh "curl --request POST --header 'Content-Type: application/json' --data '{\"text\": \"Build ${buildStatus}\nBranch: ${env.BRANCH_NAME}\nSee: https://ci.dev.eficode.io/job/Partion%20osaamiskiekko/job/osaamiskiekko/job/${env.BRANCH_NAME}/\"}' ${slackURL}"
    }
  } catch (error) {
    echo "Error notifying slack: ${error}"
  }
}

// def notifyBuild(String buildStatus = 'STARTED') {
//   buildStatus = buildStatus ?: 'SUCCESS'

//   def colorCode = '#FF9FA1'
//   def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
//   def summary = "${subject} (${env.BUILD_URL})"
//   def details = """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
//     <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>"""

//   if (buildStatus == 'STARTED') {
//     colorCode = '#D4DADF'
//   } else if (buildStatus == 'SUCCESS') {
//     summary = ":unicorn_face: Success! ${env.JOB_NAME}: ${env.BUILD_URL}"
//     colorCode = '#BDFFC3'
//   } else if (buildStatus == 'UNSTABLE') {
//     summary = ":face_with_head_bandage: Unstable! ${env.JOB_NAME}: ${env.BUILD_URL}"
//     colorCode = '#FF9FA1'
//   } else {
//     summary = ":sos: Failure! ${env.JOB_NAME}: ${env.BUILD_URL}"
//     colorCode = '#FF9FA1'
//   }

//   // TODO Re-enable slackSend if slack plugin is added to Jenkins
//   // slackSend(teamDomain: "eficode", token: credentials('slacktoken'), color: colorCode, message: summary)
// }
