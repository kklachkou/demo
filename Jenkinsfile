pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "chmod +x ./gradlew"
                sh "./gradlew clean bootJar --info"
            }
        }
        stage('Docker build') {
            steps {
                sh "aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 637994185705.dkr.ecr.us-west-2.amazonaws.com"
                sh "docker build -t spring-boot-app ."
                sh "docker tag spring-boot-app:latest 637994185705.dkr.ecr.us-west-2.amazonaws.com/spring-boot-app:latest"
                sh "docker push 637994185705.dkr.ecr.us-west-2.amazonaws.com/spring-boot-app:latest"
            }
        }
        stage('Docker deploy') {
            steps {
                sshagent(['ec2-user']) {
                    sh "ssh ec2-user@34.210.97.136 'aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 637994185705.dkr.ecr.us-west-2.amazonaws.com'"
                    sh "ssh ec2-user@34.210.97.136 'docker pull 637994185705.dkr.ecr.us-west-2.amazonaws.com/spring-boot-app:latest'"
                }
            }
        }
    }
}