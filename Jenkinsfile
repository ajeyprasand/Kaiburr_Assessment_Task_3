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
                withCredentials([string(credentialsId: 'Sonar-Token', variable: 'SONAR_AUTH_TOKEN')]) {
                    bat 'mvn sonar:sonar -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=http://192.168.0.106:9099'
                }
            }
        }
    }
}
