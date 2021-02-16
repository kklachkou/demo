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
                script {
                    sh "docker build -t app ."
                }
            }
        }
    }
}