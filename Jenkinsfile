pipeline {
    agent any
    environment {
        test_string = "msa2 al fol mn al maiiiin msa2oooo asly 3liiiiiiik"
    }
    stages {
        stage("dev") {
            steps {
                echo "test_for $test_string"
                error 'here is error'
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
