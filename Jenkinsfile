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
                sh 'docker build -t myimage .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                sh 'docker login -u lirani5900 -p Aa123456123456'
                sh 'docker push lirani5900/myimage:tagname'
            }
        }
        stage('Stop and Remove Container') {
            steps {
                sh 'docker stop $(docker ps -aq --filter ancestor=myimage)'
                sh 'docker rm $(docker ps -aq --filter ancestor=myimage)'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run -p 5000:5000 myimage'
            }
        }
    }
}
