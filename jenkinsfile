pipeline { 

    agent any
    options { disableConcurrentBuilds() }

    environment {
        AWS = credentials('AWSCred')
    }

    stages { 
        stage ('Creating AWS VPC Roboshop Application') { 
            steps { 
                sh "export aws_access_key_id"
                sh "export AWS_ACCESS_KEY_ID=${AWS_USR}"
                sh "export AWS_SECRET_ACCESS_KEY=${AWS_PSW}"
                } 
            } 
        } 
    } 