pipeline {
    agent any
    environment {
        test_string = "msa2 al fol mn al maiiiin msa2oooo"
    }
    stages {
        stage("dev") {
            steps {
                echo "test_for $test_string"
            }
            post {

                failure {
                    build 'resulted_pipe'
                }
            }
        }
    }    
        post {

            failure {
                echo "stage is failed"
            }
        }
    

}
