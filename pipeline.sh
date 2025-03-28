pipeline {
    agent none  // Use `agent` at the stage level
    environment {
        AWS_REGION = 'us-east-1'
    }
    stages {
        stage('Terraform Init') {
            agent {
                label 'docker-agent' // Use the node with Docker installed
            }
            steps {
                script {
                    docker.image('hashicorp/terraform:latest').inside {
                        sh '''
                        terraform init
                        terraform validate
                        '''
                    }
                }
            }
        }
        stage('Terraform Plan') {
            agent {
                label 'docker-agent'
            }
            steps {
                script {
                    docker.image('hashicorp/terraform:latest').inside {
                        sh '''
                        terraform plan -input=false -out=tfplan
                        '''
                    }
                }
            }
        }
        stage('Terraform Apply') {
            agent {
                label 'docker-agent'
            }
            steps {
                script {
                    docker.image('hashicorp/terraform:latest').inside {
                        sh '''
                        terraform apply -input=false -auto-approve tfplan
                        '''
                    }
                }
            }
        }
        stage('Terraform Destroy') {
            agent {
                label 'docker-agent'
            }
            when {
                expression {
                    return input(message: 'Do you want to destroy the infrastructure?', ok: 'Yes')
                }
            }
            steps {
                script {
                    docker.image('hashicorp/terraform:latest').inside {
                        sh '''
                        terraform destroy -input=false -auto-approve
                        '''
                    }
                }
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}