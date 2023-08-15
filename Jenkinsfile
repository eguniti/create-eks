#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            when {
                   expression { choice == 'Create-EKS-Cluster'}
            }
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init -reconfigure"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Delete an EKS Cluster") {
            when {
                   expression { choice == 'Delete-EKS-Cluster'}
            }
            steps {
                script {
                    dir('terraform') {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }
    }
}
