pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Stop and Remove MyImage Containers') {
            steps {
                       if (sh(
                            script: 'docker ps -a --filter "ancestor=myimage" | grep -q "myimage"',
                            returnStatus: true
                        ) == 0) {
                        sh 'docker stop $(docker ps -a --filter "ancestor=myimage" -q)'
                        sh 'docker rm $(docker ps -a --filter "ancestor=myimage" -q)'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t lirani5900/myimage:$BUILD_NUMBER .'
            }
        }
         stage('Push to Docker Hub') {
            steps {
                sh 'docker login -u lirani5900 -p Aa123456123456'
                sh 'docker push lirani5900/myimage:$BUILD_NUMBER'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker stop $(docker ps -q --filter "publish=5000") || true'
                sh 'docker rm $(docker ps -q --filter "publish=5000") || true'
                sh 'docker pull lirani5900/myimage:$BUILD_NUMBER'
                sh 'docker run --detach -p 5000:5000 lirani5900/myimage:$BUILD_NUMBER'
            }
        }
       
    }
}
