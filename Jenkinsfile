pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Containerize') {
            steps {
                sh 'skaffold build --default-repo=localhost:5000'
            }
        }
        stage('Deploy') {
            steps {
                sh 'skaffold run --default-repo=localhost:5000'
            }
        }
    }
}
