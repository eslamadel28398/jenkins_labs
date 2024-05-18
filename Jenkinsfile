pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {
        stage('Terraform Init') {
            steps {

                    sh 'terraform init'
                    sh 'terraform ${action} --auto-approve'
                    sh 'terraform output -raw instance_ip > inventory'
                
            }
        }
    }
}
