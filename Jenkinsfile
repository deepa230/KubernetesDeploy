pipeline {
    agent any
  environment {
    PATH = "/usr/sbin:$PATH"
  }
    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', credentialsId: 'Git', url: 'https://github.com/deepa230/KubernetesDeploy.git'
            }
        }
        stage('Helm Package Creation') {
            steps {
                sh "helm create phpmyadmin"
                sh "rm -rf ./phpmyadmin/templates/*"
                sh "cp *.yaml ./phpmyadmin/templates/"
                sh "helm package phpmyadmin"
            }
        }
        stage('Deploy to K8s') {
            steps {
                sshagent(['Kubernetes']) {
                    sh '''
                    scp -o StrictHostKeyChecking=no ./*.tgz ubuntu@13.126.18.218:/home/ubuntu
                    scp -o StrictHostKeyChecking=no /home/ubuntu/linux-amd64/helm ubuntu@13.126.18.218:/home/ubuntu
                    ssh -t ubuntu@13.126.18.218 /bin/bash << 'EOF' 
                    sudo mv ./helm /usr/local/bin/ 
                    sudo chmod +x /usr/local/bin/helm 
                    export PATH=/usr/local/bin/:$PATH
                    helm upgrade --install phpmyadm ./*.tgz 
EOF
                     '''
                    }
            }
        }
        
    }
}
