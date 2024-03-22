pipeline {
    agent {
        docker {
            // Указываем Docker-образ для сборки
            image 'ваш_образ_для_сборки:тег'
            // Указываем дополнительные параметры, например, для использования Docker-демона хоста
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                // Шаги для сборки проекта внутри контейнера
                sh 'cd /path/to/your/project && mvn clean package' // Пример для проекта на Maven
            }
        }
        stage('Publish Artifact') {
            steps {
                // Шаг для выгрузки бинарного файла как артефакта
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true // Пример для Maven
            }
        }
    }
    post {
        success {
            // Действия, выполняемые при успешной работе пайплайна
            echo 'Pipeline completed successfully!'
            // Добавьте дополнительные действия, если нужно
        }
    }
}
