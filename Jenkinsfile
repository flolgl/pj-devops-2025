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
        stage('Build docker image') {
            steps {
                script {
                    docker.build('go-pj:latest')
                }
            }
        }
        stage('Run image in container') {
            steps {
                script {
                    docker.image('go-pj:latest').run('-d -p 8080:8080')
                }
            }
        }
    }
}