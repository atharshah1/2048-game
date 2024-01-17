pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                sshagent(credentials: ['ssh-key']) {
                    sh 'ssh ubuntu@52.23.224.169 "cd ~/app && git pull https://github.com/atharshah1/2048-game/"'
                }
            }
        }
        stage('Build') {
            steps {
                sshagent(credentials: ['ssh-key']) {
                    sh 'ssh ubuntu@52.23.224.169 "cd ~/app/2048-game/ && docker build -t app ."'
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(credentials: ['ssh-key']) {
                    sh 'ssh ubuntu@52.23.224.169 "cd ~/app/2048-game/ && docker run -p 80:80 -d app"'
                }
            }
        }
    }
}
