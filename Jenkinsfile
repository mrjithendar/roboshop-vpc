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
                    sh "terraform -chdir=${tfDir} init -reconfigure"
                    sh "terraform -chdir=${tfDir} validate"
                    sh "terraform -chdir=${tfDir} plan -var-file=vars/dev.tfvars -out=planfile"
                    sh "terraform -chdir=${tfDir} apply -var-file=vars/dev.tfvars planfile"
                }
            }
            } 
        } 
    } 