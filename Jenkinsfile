pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/atjbramley/pipeline_1.git'
      }
    }
    stage('Docker build') {
      steps {
        sh 'docker build -t atjb/pipeline_1 .'
      }
    }
    stage('Docker login') {
      steps {
        sh 'docker login --username atjb --password c3206ad3-5263-4fba-b0ae-b733c99b9164'
      }
    }
    stage('Docker push') {
      steps {
        sh 'docker push atjb/pipeline_1'
      }
    }
  }
  post {
    always {
      mail to: 'atjbramley@hotmail.com',
      subject: 'Completed Pipeline: pipeline_1',
      body: 'Your build has run!  Please check Jenkins'
    }
  }
}
