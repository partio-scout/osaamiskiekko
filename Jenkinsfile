dockerEnvironment = "osaamiskiekko"
compose = "docker-compose --project-directory . -p ${dockerEnvironment}"
projectName = "partio-osaamiskiekko"

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

    // stage('Acceptance Test') {
    //   steps {
    //     sh """${compose} \
    //       -f compose/robot.yml \
    //       run robot"""

    //     step([$class: 'RobotPublisher',
    //         disableArchiveOutput: false,
    //         logFileName: 'results/robot/log.html',
    //         onlyCritical: true,
    //         otherFiles: '',
    //         outputFileName: 'results/robot/output.xml',
    //         outputPath: '.',
    //         passThreshold: 90,
    //         reportFileName: 'results/robot/report.html',
    //         unstableThreshold: 100]);

    //     sh """${compose} \
    //       -f compose/robot.yml \
    //       down -v"""
    //   }
    // }
  }

  post {
    always {
      notifyBuild(currentBuild.result)
      // TODO: Enable unit test archival
    //   step([$class: 'JUnitResultArchiver', testResults: 'results/mocha/test-results.xml'])
      sh """${compose} \
        -f docker-compose.yml \
        -f docker-compose-production.yml \
        down -v"""
    }
  }
}

def buildImages() {
  sh """${compose} \
    -f docker-compose.yml \
    -f docker-compose-frontend.yml \
    build --pull api db frontend"""
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

  slackSend(teamDomain: "eficode", token: credentials('slacktoken'), color: colorCode, message: summary)
}
