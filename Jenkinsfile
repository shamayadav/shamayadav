pipeline {
    agent any
    tools{
        terraform 'terraform12'
    }
    stages {
        stage ("checkout from GIT") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/shamayadav/shamayadav.git']]])
            }
        }
        stage ("terraform init") {
            steps {
                sh 'terraform init'
                sh 'terraform fmt'
                sh 'terraform validate'
                sh 'terraform plan'
            }
        }
        
        stage ("terraform apply and notify") {
            steps {
                sh 'terraform apply --auto-approve'
                //mail bcc: '', body: 'New VM created', cc: '', from: '', replyTo: '', subject: 'New VM created', to: 'vijay209201@gmail.com'
            }
        }
    }
}
