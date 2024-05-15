pipeline {
    agent any
    environment {
        test_string = "sba7 al fol mn al maiiiin sba7oooooooooo"
    }
    stages {
        stage("dev") {
            steps {
                echo .."test_for $test_string"
            }
            post {

                failure {
                    echo "failure is happened"
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

