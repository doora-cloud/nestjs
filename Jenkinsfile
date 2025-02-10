#!/usr/bin/env groovy

pipeline {
    agent any

    tools {
        dockerTool "Default"
    }

    environment {
//        REGISTRY_ORG = 'doora'
//        REGISTRY_CRED_ID = 'doora-registry'

        IMAGE_NAME = "${env.REGISTRY_URL}/${env.REGISTRY_ORG}/nestjs:20"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    sh "docker build -t ${env.IMAGE_NAME} ."
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: env.REGISTRY_CRED_ID) {
                        sh "docker push ${env.IMAGE_NAME}"
                    }
                }
          }
        }
    }

    post {
        always {
            deleteDir()

            sh 'docker image prune -a -f'
            sh 'docker logout'
        }
    }
}