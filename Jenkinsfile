pipeline {
    agent {
        docker {
            image 'openjdk:11' // Используем образ OpenJDK 11
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'git clone https://github.com/Kitchenez/task2.git' // Клонируем репозиторий
                sh 'cd task2 && ./gradlew build' // Собираем проект внутри контейнера
            }
            post {
                success {
                    archiveArtifacts artifacts: 'task2/build/libs/*.jar', fingerprint: true // Архивируем артефакты сборки
                }
            }
        }
    }
}
