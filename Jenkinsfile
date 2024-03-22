pipeline {
    agent {
        docker {
            image 'maven:3.8.1-jdk-11' // Используем образ Maven с JDK 11 для сборки проекта
            args '-v /root/.m2:/root/.m2' // Монтируем папку Maven для кэширования зависимостей
        }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('maven:3.8.1-jdk-11').inside { // Запускаем сборку внутри контейнера
                        sh 'mvn clean package' // Сборка проекта с помощью Maven
                    }
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true // Архивируем готовый бинарник
                }
            }
        }
    }
}
