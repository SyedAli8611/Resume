This repository contains a Jenkins pipeline for automating the build and deployment of a Docker image using an Nginx server. The process includes checking out the code from GitHub, building the Docker image, logging in to DockerHub, and publishing the image.
Prerequisites
- Jenkins installed and configured
- Docker installed on the Jenkins server
- A DockerHub account
- Jenkins Credentials Plugin for managing information

Pipeline Overview
The Jenkins pipeline automates the process of:
- Checking out the code from a specified GitHub repository.
- Building a Docker image using the provided Dockerfile.
- Logging into DockerHub using secure credentials.
- Pushing the newly built image to DockerHub.

Steps
1. SCM Checkout
In this stage, the pipeline checks out the code from the specified GitHub repository.
stage('SCM_Checkout') {
    steps {
        echo 'Perform SCM Checkout'
        git 'https://github.com/SyedAli8611/Resume1.git'
    }
}
2. Docker Build
This stage builds the Docker image using the Dockerfile in the repository.
stage('Docker Build') {
    steps {
        echo 'Perform Docker Build'
        sh "docker build -t iamfaizanali/automate_image:${BUILD_NUMBER} ."
        sh 'docker image list'
    }
}
3. Login to DockerHub
In this stage, the pipeline logs into DockerHub using credentials stored in Jenkins.
stage('Login to Dockerhub') {
    steps {
        echo 'Login to DockerHub'
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
    }
}
4. Publish the Image to DockerHub
Finally, the pipeline publishes the Docker image to DockerHub.
stage('Publish the Image to Dockerhub') {
    steps {
        echo 'Publish to DockerHub'
        sh "docker push iamfaizanali/automate_image:${BUILD_NUMBER}"                
    }
}


