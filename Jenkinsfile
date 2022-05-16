pipeline{
    environment{
        IMAGE_NAME="mohammadathar/2048-game"
        REPO_NAME="2048-game"
        dockerImage=''
        DOCKER_C = 'docker_credentials'
    }
    agent any
    stages{
        stage('Building Image'){
            steps{
                // using docker pipeline plugin
                script{
                    dockerImage = docker.build env.IMAGE_NAME
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
     sh 'scp -r -o StrictHostKeyChecking=no 2048-deployment-service.yml ubuntu@3.92.226.106:/home/ubuntu/'
script{
      try{
       sh 'ssh ubuntu@3.92.226.106 kubectl apply -f /home/ubuntu/2048-deployment-service.yml --kubeconfig=/home/ubuntu/.kube/config'
}catch(error)
       {
}
     }
    }
   }
  }
    }
}
