pipeline {
    environment {
        registry = 'suramnithin/dockerjenkins'
        registryCredential = 'dockerhub_id'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning our Git') {
            steps {
                 git branch:'main', url: ' https://github.com/Nithin93981/dockertesting.git'
            }
        }
        stage('Building our image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":v$BUILD_NUMBER"
                }
            }
        }
        stage('Push Image To DockerHUB') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("v$BUILD_NUMBER")
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                sh "docker rmi $registry:v$BUILD_NUMBER"
            }
        }
        stage('Deploying to Docker Swarm') {
            steps {
                sh "docker stop  nginx || true"
                sh "docker run --rm -dit  --name nginx -p 9500:80 $registry:v$BUILD_NUMBER"
            }
        }
    }
}
