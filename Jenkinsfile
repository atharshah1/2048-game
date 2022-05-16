pipeline{
    environment{
        IMAGE_NAME="mohammadathar/2048-game"
        REPO_NAME="2048-game"
        dockerImage='my docker'
        DOCKER_C=credentials('docker_credentials')
    }
    agent any
    stages{
        stage('Building Image'){
            steps{
                // using docker pipeline plugin
                script{
                    sh "sudo docker build -t ${IMAGE_NAME} ."
                }
            }
        }
        stage('pushing image to dockerhub'){
            steps{
                script{   
                sh 'echo $DOCKERHUB_C_PSW | docker login -u $DOCKERHUB_C_USR --password-stdin'
                sh "docker push ${IMAGE_NAME}"
                  
                }
            }
        }
        stage('Deploy to K8s')
  {
   steps{
    sshagent(['k8s-jenkins'])
    {
     sh 'scp -r -o StrictHostKeyChecking=no 2048-deployment-service.yml ubuntu@34.203.246.129:$HOME/'
script{
      try{
       sh 'ssh ubuntu@34.203.246.129 kubectl apply -f $HOME/2048-deployment-service.yml --kubeconfig=/home/ubuntu/.kube/config'
}catch(error)
       {
}
     }
    }
   }
  }
    }
}
