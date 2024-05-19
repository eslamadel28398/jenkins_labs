pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {
        stage('Terraform stage') {
            steps {

                    sh 'terraform init'
                    sh 'terraform ${action} --auto-approve'
                    sh 'terraform output -raw instance_ip > inventory.yml'
                
            }

            
        }
        stage("asnible_stage"){
            steps{
                sh 'ssh -i my_keypair ubuntu@54.200.68.141'
                sh 'ansible-playbook -i inventory.yml -u ubuntu --private-key=my_keypair ansible.yml'
            }

        }
    }
}
