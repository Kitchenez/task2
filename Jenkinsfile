pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Шаг для загрузки кода из репозитория
                checkout scm
            }
        }
        stage('Build') {
            agent {
                docker {
                    // Используем образ openjdk для сборки
                    image 'openjdk:latest'
                }
            }
            steps {
                // Компилируем исходный код Java
                sh 'javac -cp junit.jar:. *.java'
            }
        }
        stage('Publish Artifact') {
            steps {
                // Копируем скомпилированные файлы в рабочую директорию
                sh 'cp *.class /app'
                // Сохраняем файлы как артефакты
                archiveArtifacts artifacts: '*.class', fingerprint: true
            }
        }
    }
    post {
        success {
            // Выводим сообщение об успешном завершении пайплайна
            echo 'Pipeline completed successfully!'
        }
    }
}
