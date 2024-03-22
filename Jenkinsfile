pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('openjdk:11').inside {
                        sh 'git clone https://github.com/Kitchenez/task2.git project' // Клонируем репозиторий с проектом
                        sh "cd ${WORKSPACE}/project && ./gradlew build" // Выполняем сборку проекта с помощью Gradle
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
