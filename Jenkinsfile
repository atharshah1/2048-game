pipeline {
    agent any
    environment {
        PROJECT_ID = 'telepain-md-stage'
        CLUSTER_NAME = 'telepain-qa-cluster'
        LOCATION = 'us-central1-a'
        CREDENTIALS_ID = 'telepain-md-stage'
    }
    stages {
        stage('GitHub') {
      steps {
        git 'https://github.com/atharshah1/2048-game.git'
      }
    }
    
        stage('Deploy to GKE') {
            steps{

                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: '2048-deployment-service.yml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
    }    
}
