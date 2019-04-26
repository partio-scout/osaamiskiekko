dockerEnvironment = "osaamiskiekko"
compose = "docker-compose --project-directory . -p ${dockerEnvironment}"
projectName = "partionosaamiskiekko"
dockerRepository = "artifactory.dev.eficode.io"
dockerFrontendImage = "${dockerRepository}/${projectName}/${dockerEnvironment}/frontend_${env.BRANCH_NAME}"
dockerBackendImage = "${dockerRepository}/${projectName}/${dockerEnvironment}/api_${env.BRANCH_NAME}"

publishedBranches = [ "master", "staging", "production"]

pipeline {
  agent {
    label 'docker'
  }
  
  environment {
    DOCKER_HOST = 'tcp://127.0.0.1:2375'
    COMPOSE_HTTP_TIMEOUT = 1000
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

    stage('Build') {
      steps {
        buildImages()
      }
    }

    stage('Front-End unit tests') {
      steps {
        sh """${compose} \
            -f compose/frontend-unittests.yml up
           """
      }
    }    

    // TODO: Enable StrapiCMS unit
    // stage('Unit Test') {
    //   steps {
    //     sh """${compose} \
    //       -f compose/test.yml \
    //       run mocha"""

    //     sh """${compose} \
    //     -f compose/test.yml \
    //     down -v"""
    //   }
    // }

    stage('Acceptance Test') {
      steps {
        sh """${compose} \
          -f docker-compose.yml \
          -f compose/frontend.yml \
          -f compose/robot.yml \
          run robot"""

        step([$class: 'RobotPublisher',
            disableArchiveOutput: false,
            logFileName: 'results/robot/log.html',
            onlyCritical: true,
            otherFiles: '',
            outputFileName: 'results/robot/output.xml',
            outputPath: '.',
            passThreshold: 90,
            reportFileName: 'results/robot/report.html',
            unstableThreshold: 100]);

        sh """${compose} \
          -f docker-compose.yml \
          -f compose/frontend.yml \
          -f compose/robot.yml \
          down -v"""
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

          echo "Using docker username ${env.USERNAME}."
          sh "docker login ${dockerRepository} -u $USERNAME -p $PASSWORD"

          labelAndPush(env.VERSION)
        }
      }
    }
  }

  post {
    always {
      notifyBuild(currentBuild.result)
      // TODO: Enable unit test archival
      // step([$class: 'JUnitResultArchiver', testResults: 'results/mocha/test-results.xml'])
      sh """${compose} \
        -f docker-compose.yml \
        -f compose/frontend.yml \
        down -v"""
    }
  }
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
  sh "docker tag ${dockerEnvironment}_frontend ${dockerFrontendImage}:${version}"
  sh "docker tag ${dockerEnvironment}_api ${dockerBackendImage}:${version}"
}

def pushToDockerhub(version) {
  // If you want to fail the pipeline when the version number is not bumped,
  // uncomment the next 2 lines and comment out the rest.
  // sh "docker push ${dockerFrontendImage}:${version} || (echo 'Looks like the push failed. Did you remember to bump the package version number?' && false)"
  // sh "docker push ${dockerBackendImage}:${version} || (echo 'Looks like the push failed. Did you remember to bump the package version number?' && false)"

  sh "docker push ${dockerFrontendImage}:${version} || (echo 'Looks like the push failed. Did you remember to bump the package version number? Skipping push.' && true)"
  sh "docker push ${dockerBackendImage}:${version} || (echo 'Looks like the push failed. Did you remember to bump the package version number? Skipping push.' && true)"
}


def notifyBuild(String buildStatus = 'STARTED') {
  buildStatus = buildStatus ?: 'SUCCESS'

  def colorCode = '#FF9FA1'
  def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
  def summary = "${subject} (${env.BUILD_URL})"
  def details = """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
    <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>"""

  if (buildStatus == 'STARTED') {
    colorCode = '#D4DADF'
  } else if (buildStatus == 'SUCCESS') {
    summary = ":unicorn_face: Success! ${env.JOB_NAME}: ${env.BUILD_URL}"
    colorCode = '#BDFFC3'
  } else if (buildStatus == 'UNSTABLE') {
    summary = ":face_with_head_bandage: Unstable! ${env.JOB_NAME}: ${env.BUILD_URL}"
    colorCode = '#FF9FA1'
  } else {
    summary = ":sos: Failure! ${env.JOB_NAME}: ${env.BUILD_URL}"
    colorCode = '#FF9FA1'
  }

  // TODO Re-enable slackSend if slack plugin is added to Jenkins
  // slackSend(teamDomain: "eficode", token: credentials('slacktoken'), color: colorCode, message: summary)
}
