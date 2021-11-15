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
            }
        }
        stage ("terraform fmt") {
            steps {
                sh 'terraform fmt'
            }
        }
        stage ("terraform validate") {
            steps {
                sh 'terraform validate'
            }
        }
        stage ("terrafrom plan") {
            steps {
                sh 'terraform plan '
            }
        }
        stage ("terraform apply") {
            steps {
                sh 'terraform apply --auto-approve'
                sh 'var=$(terraform output vm-address1)'
                sh 'var1=$(terraform output vm-address2)'
                sh 'echo $var and $var1'
            }
        }
    }
}
