pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('openjdk:11').inside {
                        sh 'git clone <repository_url> project' // Клонируем репозиторий с проектом
                        sh 'cd project && ./gradlew build' // Выполняем сборку проекта с помощью Gradle (предполагается, что ваш проект использует Gradle)
                    }
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: 'project/build/libs/*.jar', fingerprint: true // Архивируем готовый бинарник
                }
            }
        }
    }
}
