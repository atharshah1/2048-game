pipeline{
    environment{
        IMAGE_NAME="mohammadathar/2048-game"
        REPO_NAME="2048-game"
        dockerImage=''
        DOCKER_C='docker_credentials'
    }
    agent any
    stages{
        stage('Cloning repo'){
            steps{
                git 'https://github.com/atharshah1/2048-game'
            }
        }
        stage('Building Image'){
            steps{
                // using docker pipeline plugin
                script{
                    dockerImage = Docker.build("${IMAGE_NAME}", "./${REPO_NAME}/Dockerfile")
                }
            }
        }
        stage('pushing image to dockerhub'){
            steps{
                script{   
                docker.withRegistry('', env.DOCKER_C){
                    dockerImage.push()
                    }
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
