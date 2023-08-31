pipeline {
    agent any
    stages {
        stage('Install Docker and kubectl') {
            steps {
                sh 'apt-get update'
                sh 'apt-get install -y docker.io'
                sh 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"'
                sh 'chmod +x kubectl'
                sh 'mv kubectl /usr/local/bin/'
            }
        }
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
