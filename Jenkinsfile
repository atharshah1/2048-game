pipeline{
    environment{
        IMAGE_NAME="mohammadathar/2048-game"
        REPO_NAME="2048-game"
        USERNAME="mohammadathar"
        PASS=<password>
    }
    agent any
    stages{
        stage('Cloning repo'){
            steps{
                git 'https://github.com/gabrielecirulli/2048'
            }
        }
        stage('Building Image'){
            steps{
                sh 'docker build -f ./${REPO_NAME}/Dockerfile -t ${IMAGE_NAME}:${BUILD_NUMBER} .'
            }
        }
        stage('pushing image to dockerhub'){
            sh 'docker login -u=${USERNAME} -p=${PASS}'
            sh 'docker push ${IMAGE_NAME}'
        }
    }
}