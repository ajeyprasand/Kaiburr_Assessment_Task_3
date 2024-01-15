pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/ajeyprasand/Kaiburr_Assessment_Task_4.git']]])
                }
            }
        }
        stage('Build Code') {
            steps {
                bat 'mvn clean package'
            }
        }
        stage('Static Code Analysis') {
            steps {
                script {
                        withCredentials([string(credentialsId: 'sonarqube', variable: 'SONAR_TOKEN')]) {
                    bat "mvn sonar:sonar -Dsonar.token=${SONAR_TOKEN} -Dsonar.host.url=http://192.168.0.106:9099 -Dsonar.projectKey=Task_4"
                    }
                }    
            }
        }
        stage('Build Docker') {
            steps {
                 script {
                        bat 'docker build -t blank0015/app .'
                }
            }
        }
        stage('Deploy Image') {
            steps {
                 script {
                        bat 'docker build -t blank0015/app .'
                }
            }
        }
    stage('Deploy Image') {
            steps {
                script {
                     withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerpwd')]) {
                             bat 'docker login -u blank0015 -p ${docker-pwd}'
                             bat 'docker push blank0015/app'
                        }
                }
            }
        }
    }

}
