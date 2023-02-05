pipeline {
    agent {
        docker {
            image 'python:3.7'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'python -m venv venv'
                sh '. venv/bin/activate'
                sh 'pip install --ubuntu flask'
                sh 'python app.py &'
            }
        }
        stage('Test') {
            steps {
                sh 'sleep 30'
                sh 'curl http://localhost:5000'
            }
        }
    }
}
