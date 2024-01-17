pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                sshagent(credentials: ['ssh-key']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@52.23.224.169 "cd ~/app && git pull https://github.com/atharshah1/2048-game/"'
                }
            }
        }
        stage('Build') {
            steps {
                sshagent(credentials: ['ssh-key']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@52.23.224.169 "cd ~/app && docker build -t app ."'
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(credentials: ['ssh-key']) {
                    sh 'ssh -o StrictHostKeyChecking=no ubuntu@52.23.224.169 "cd ~/app && docker run -p 80:80 -d app"'
                }
            }
        }
    }
}
