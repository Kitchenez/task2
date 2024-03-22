pipeline {
    agent {
        docker {
            image 'openjdk:latest' // Образ с Java Development Kit
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('openjdk:latest').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                        sh 'javac -cp junit.jar:. *.java' // Компилируем исходный код Java
                        sh 'jar cfe app.jar MainClass *.class' // Создаем исполняемый JAR файл
                    }
                }
            }
        }
        stage('Publish Artifact') {
            steps {
                script {
                    docker.image('openjdk:latest').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                        sh 'cp app.jar /app' // Копируем исполняемый JAR файл в рабочую директорию
                    }
                }
                archiveArtifacts artifacts: 'app.jar', fingerprint: true // Сохраняем JAR файл как артефакт
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
