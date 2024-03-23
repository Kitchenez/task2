pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Kitchenez/task2']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t notaoktas/devops-integration .'
                }
            }
        }
        stage('Push image to Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u notaoktas -p ${dockerhubpwd}'
                    }
                    sh 'docker push notaoktas/devops-integration'
                }
            }
        }
    }
    post {
        success {
            // Копируем исполняемый файл в директорию с артефактами
            sh 'cp target/*.jar ${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_NUMBER}/archive/'
            archiveArtifacts 'target/*.jar' // Указываем, какой файл архивировать как артефакт
        }
    }
}
