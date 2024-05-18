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
                sh 'ansible-playbook -i inventory.yml -u ubuntu --private-key="-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----" ansible.yml'
            }

        }
    }
}
