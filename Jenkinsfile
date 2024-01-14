pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/ajeyprasand/Kaiburr_Assessment_Task_3.git']]])
                }
            }
        }
        stage('Build and Test') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Static Code Analysis') {
            steps {
                withCredentials([string(credentialsId: 'sonarqube')]) {
                    bat 'mvn sonar:sonar --Dsonar.login="admin" -Dsonar.login="qusjzm@123" -Dsonar.host.url=http://192.168.0.106:9099'
                }
            }
        }
    }
}
