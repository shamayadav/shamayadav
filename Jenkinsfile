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
                sh 'var=$(terraform output vm-address1)'
                sh 'var1=$(terraform output vm-name)'
                sh 'echo Name is $var1 and IP is $var'
                //mail bcc: '', body: 'VM name is $var1 and VM IP is $var', cc: '', from: '', replyTo: '', subject: 'New VM created', to: 'vijay209201@gmail.com'
            }
        }
    }
}
