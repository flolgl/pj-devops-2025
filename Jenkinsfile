pipeline {
    agent {
    	label 'jenkins-slave'
    }
    stages {
        stage('Clone repo') {
            steps {
                git branch: 'main', credentialsId: 'git_credentials', url :'https://github.com/flolgl/pj-devops-2025'
            }
        }
        stage('Start Minikube & build docker image') {
            steps {
                script {
                    // Second line, used to transfer image to minikube, cf https://stackoverflow.com/questions/42564058/how-can-i-use-local-docker-images-with-minikube
                    sh """
                        minikube start --driver=docker --force
                        eval \$(minikube docker-env)
                        docker build -t go-pj:latest .
                    """
                    // Not using docker plugin because I can't figure out to get minikube to use the image from docker.build in Jenkins.
                }
            }
        }

        stage('Deploy to dev environment and create namespace') {
            steps {
                script {
                    // Create namespace with yaml (if not exists, cf https://stackoverflow.com/questions/63135361/how-to-create-kubernetes-namespace-if-it-does-not-exist)
                    // and then deploy
                    sh """
                        kubectl create -f kubernetes/namespace-dev.yaml || echo "namespace already exists"
                        kubectl apply -f kubernetes/deploy-dev.yaml
                        kubectl apply -f kubernetes/service-dev.yaml
                    """
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    int status = sh(
                        script: "curl -sLI -w '%{http_code}' http://\$(minikube ip):31081/whoami -o /dev/null",
                        returnStdout: true
                    )

                    if (status != 200) {
                        error("Returned status code different than 200")
                    }
                }
            }
        }

        stage('Deploy to prod environment and create namespace') {
            steps {
                script {
                    // Create namespace with yaml (if not exists, cf https://stackoverflow.com/questions/63135361/how-to-create-kubernetes-namespace-if-it-does-not-exist)
                    // and then deploy
                    sh """
                        kubectl create -f kubernetes/namespace-prod.yaml || echo "namespace already exists"
                        kubectl apply -f kubernetes/deploy-prod.yaml
                        kubectl apply -f kubernetes/service-prod.yaml
                    """
                }
            }
        }
    }
}