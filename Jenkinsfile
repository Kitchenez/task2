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
                    args '-v /var/run/docker.sock:/var/run/docker.sock -w /app -w C:/ProgramData/Jenkins/.jenkins/workspace/task_2_ksen/ -v C:/ProgramData/Jenkins/.jenkins/workspace/task_2_ksen/:C:/ProgramData/Jenkins/.jenkins/workspace/task_2_ksen/ -v C:/ProgramData/Jenkins/.jenkins/workspace/task_2_ksen@tmp/:C:/ProgramData/Jenkins/.jenkins/workspace/task_2_ksen@tmp/ -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ******** -e ********'
                }
            }
            steps {
                // Компилируем исходный код Java
                sh 'javac -cp junit.jar:. *.java'
                // Загружаем исполняемые файлы в хранилище
                stash includes: '*.class', name: 'executables'
            }
        }
        stage('Publish Artifact') {
            steps {
                // Извлекаем файлы из хранилища
                unstash 'executables'
                // Архивируем исполняемые файлы
                archiveArtifacts artifacts: '*.exe, *.jar', fingerprint: true
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
