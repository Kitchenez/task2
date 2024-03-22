pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('openjdk:11').inside {
                        // Используем абсолютный путь к рабочему каталогу
                        sh 'git clone https://github.com/Kitchenez/task2.git C:/Users/User/Documents/GitHub/task2'
                        sh "cd C:/Users/User/Documents/GitHub/task2 && ./gradlew build"
                    }
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: 'C:/Users/User/Documents/GitHub/task2/build/libs/*.jar', fingerprint: true
                }
            }
        }
    }
}
