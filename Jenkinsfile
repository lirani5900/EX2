pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t lirani5900/myimage:tagname .'
            }
        }
        stage('Stop and Remove Containers') {
            steps {
                script {
                    def containerIds = sh(
                        script: 'docker ps -aq --filter ancestor=lirani5900/myimage:tagname',
                        returnStdout: true
                    ).trim()
                    if (containerIds) {
                        sh "docker stop ${containerIds}"
                        sh "docker rm ${containerIds}"
                    }
                }
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run --detach -p 5000:5000 myimage'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'docker login -u lirani5900 -p Aa123456123456'
                sh 'docker push lirani5900/myimage:tagname'
            }
        }
    }
}
