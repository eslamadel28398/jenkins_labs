pipeline {
    agent any
    environment {
        test_string = "sba7 al fol mn al maiiiin sba7oooooooooo"
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
