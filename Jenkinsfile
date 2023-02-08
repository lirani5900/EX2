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
        stage('Push to Docker Hub') {
            steps {
                sh 'docker login -u lirani5900 -p Aa123456123456'
                sh 'docker push lirani5900/myimage:tagname'
            }
        }
        stage('Check for Running Container') {
            when {
                changeset '**/*'
            }
            steps {
                script {
                    def runningContainer = sh script: 'docker ps -q --filter ancestor=myimage', returnStdout: true
                    if (runningContainer.trim().length() > 0) {
                        stage('Stop and Remove Container') {
                            steps {
                                sh 'docker stop $(docker ps -aq --filter ancestor=myimage)'
                                sh 'docker rm $(docker ps -aq --filter ancestor=myimage)'
                            }
                        }
                    }
                }
            }
        }
        stage('Run Container') {
            when {
                changeset '**/*'
            }
            steps {
                sh 'docker run -p 5000:5000 myimage'
            }
        }
    }
}
