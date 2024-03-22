pipeline {
    agent {
        docker {
            // Используем образ openjdk для сборки
            image 'openjdk:latest'
            // Указываем рабочую директорию внутри контейнера
            args '-v /var/run/docker.sock:/var/run/docker.sock -w /app'
        }
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Шаг для загрузки кода из репозитория
                checkout scm
            }
        }
        stage('Build') {
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
