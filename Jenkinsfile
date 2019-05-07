dockerEnvironment = "osaamiskiekko"
compose = "docker-compose --project-directory . -p ${dockerEnvironment}"
projectName = "partionosaamiskiekko"
dockerRepository = "artifactory.dev.eficode.io"
dockerFrontendImage = "${dockerRepository}/${projectName}/${dockerEnvironment}/frontend_${env.BRANCH_NAME}"
dockerBackendImage = "${dockerRepository}/${projectName}/${dockerEnvironment}/backend_${env.BRANCH_NAME}"
taggedFrontendImage = dockerFrontendImage
taggedBackendImage = dockerBackendImage

publishedBranches = [ "master", "testing", "staging", "production"]

pipeline {
  agent {
    label 'tabletkoulu'
  }
  
  environment {
    DOCKER_HOST = 'tcp://127.0.0.1:2375'
    COMPOSE_HTTP_TIMEOUT = 1000
    DEVCLUSTER= "osaamiskiekko-dev-cluster"
    GCLOUDPARAM= "--zone europe-north1-a"
    GCLOUD_PROJECT="osaamiskiekko"
  }

  options {
    timeout(time: 20, unit: 'MINUTES')
  }

  stages {
    stage('Checkout') {
      steps {
        notifyBuild('STARTED')
        checkout scm
      }
    }

    // stage('Analysis') {
    //   steps {
    //     script {
    //       echo "setting scannerHome"
    //       scannerHome = tool "Sonar Scanner 3.3.0.1492"
    //       echo "scannerHome set"
    //     }
        
    //     withSonarQubeEnv('SonarQube 5.6.6 (sonar)') {
    //       echo "Executing sonar scanner"
    //       withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "${partionosaamiskiekko-bot-w_password}", usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
    //         sh "${scannerHome}/bin/sonar-scanner -Dsonar.login=${USERNAME} -Dsonar.password=${PASSWORD} -Dsonar.branch=${env.BRANCH_NAME}"
    //       }
    //       echo "Scan finished"
    //     }
    //   }
    // }

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
          
          archive 'unit-test.log'

          sh """${compose} \
            -f compose/frontend-unittests.yml \
            down"""
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
          
          archive 'acceptance-test.log'

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

    stage('kubectl init') {
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
          sh "gcloud config set project ${GCLOUD_PROJECT}"
          sh "gcloud container clusters get-credentials ${env.DEVCLUSTER} ${env.GCLOUDPARAM}"
          sh "kubectl get pods" // just testing connection first
          sh "kubectl create namespace ${env.NAMESPACE} || true"
          sh "gcloud auth configure-docker"
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
        }

        // Create or update docker registry credentials
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'partionosaamiskiekko-bot-w_password',
          usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          sh """kubectl create secret docker-registry eficode-artifactory-cred \
            --docker-server=${dockerRepository} \
            --docker-username=$USERNAME \
            --docker-password=$PASSWORD \
            --docker-email=partionosaamiskiekko-bot@rum.invalid \
            -n ${env.NAMESPACE} || true"""

          sh """kubectl patch serviceaccount default \
            -p \"{\\\"imagePullSecrets\\\": [{\\\"name\\\": \\\"eficode-artifactory-cred\\\"}]}\" \
            -n ${env.NAMESPACE}"""
        }
        // Create or update database credentials
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'database-credentials-dev',
          usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
          sh """kubectl create secret generic database-credentials \
            --from-literal=username='${USERNAME}' \
            --from-literal=password='${PASSWORD}' \
            -n ${env.NAMESPACE} \
            --dry-run -o yaml \
            | kubectl apply -f -"""
        }
        // Deploy
        script {
          sh "kubectl apply -n ${env.NAMESPACE} -f kubectl/db.yaml"
          sh "kubectl apply -n ${env.NAMESPACE} -f kubectl/backend-service.yaml"
          sh "sed -e 's#\$BACKENDIMAGE#${taggedBackendImage}#g' kubectl/backend.yaml | kubectl apply -n ${env.NAMESPACE} -f -"
          sh "sed -e 's#\$FRONTENDIMAGE#${taggedFrontendImage}#g' kubectl/frontend.yaml | kubectl apply -n ${env.NAMESPACE} -f -"
          sh "kubectl apply -n ${env.NAMESPACE} -f kubectl/load-balancer.yaml"
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
