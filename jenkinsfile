pipeline {
    agent any
    environment {
        test_string = "sba7 al fol"
    }
    stages {
        stage("A") {
            steps {
                echo "test_for $test_string"
            }
            post {
                always {
                    echo "========always========"
                }
                success {
                    echo "========A executed successfully========"
                }
                failure {
                    echo "========A execution failed========"
                }
            }
        }
    }
    post {
        always {
            echo "========always========"
        }
        success {
            echo "========pipeline executed successfully========"
        }
        failure {
            echo "========pipeline execution failed========"
        }
    }
}

