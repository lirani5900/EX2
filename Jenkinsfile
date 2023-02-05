pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t myflaskapp .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm myflaskapp python -m unittest discover -v'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 5000:5000 myflaskapp'
            }
        }
    }
}
