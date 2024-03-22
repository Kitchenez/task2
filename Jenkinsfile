pipeline {
    agent none
    
    stages {
        stage('Build') {
            agent {
                docker { image 'maven:3.8.4-openjdk-11' }
            }
            steps {
                // Шаги сборки проекта внутри контейнера Docker
                sh 'mvn clean package'
            }
        }
    }
    
    post {
        success {
            // Загрузка JAR-файла в артефакты при успешном завершении сборки
            archiveArtifacts 'target/*.jar'
        }
    }
}
