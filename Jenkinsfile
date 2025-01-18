pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'pushkar3002/flask-speech-app:latest'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/pushkar3002/Voice-TO-Text-Using-Python.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Use credentials without exposing them in the code
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Login to Docker Hub with the username and password environment variables
                        sh "echo \$DOCKER_PASSWORD | docker login -u \$DOCKER_USERNAME --password-stdin"
                        
                        // Push the Docker image
                        sh "docker push $DOCKER_IMAGE"
                    }
                }
            }
        }
    }
}
