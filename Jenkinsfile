pipeline { 

    agent any
    options { disableConcurrentBuilds() }

    environment {
        region = "us-east-1"
    }

    stages { 
        stage ('Creating AWS VPC DKODE Applications') { 
            steps {
                withAWS(credentials: 'AWSCred', region: "${region}") {
                    sh "terraform --version"
                    sh "terraform init -reconfigure"
                    sh "terraform validate"
                    sh "terraform plan -var-file=vars/dev.tfvars -out=planfile"
                    sh "terraform apply planfile"
                }
            }
            } 
        } 
    } 