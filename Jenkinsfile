pipeline {
    agent {
        docker {
            image 'ваш_образ_для_сборки:тег'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'cd C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\task_2_ksen && javac -cp junit.jar;. *.java'
            }
        }
        stage('Publish Artifact') {
            steps {
                sh 'cp /path/to/your/project/*.class /app' // Копируем скомпилированные файлы в рабочую директорию
                archiveArtifacts artifacts: '*.class', fingerprint: true // Сохраняем файлы как артефакты
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
