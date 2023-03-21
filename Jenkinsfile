pipeline {
    agent any
    stages {
        stage('Build Our Website') {
            steps {
                sh "script/build.sh"
            }
        }

        stage('Run unit tests') {
            steps {
                sh "script/unit_tests.sh"
            }
        }

        stage('Deploy the website') {
            steps {
                sh "script/deploy_website.sh"
            }
        }
    }

}