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
                    sh 'terraform output -raw instance_ip > inventory'
                
            }

            
        }
        
      stage('check ssh') {
             steps {
  
                sshagent(['ansible-ssh']) {
                       sh "ssh -o StrictHostKeyChecking=no ubuntu@35.91.7.73 echo hello"

                }
            }
      }
        
        stage("asnible_stage"){
            steps{
                
    sshagent(['ansible-ssh']) {
                sh 'ansible-playbook -i inventory -u ubuntu ansible.yml'

    }            
                }

        }
    }
}
