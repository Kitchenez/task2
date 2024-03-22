pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    git 'https://github.com/Kitchenez/task2.git'
                    sh 'cd task2 && ./gradlew build'
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: 'task2/build/libs/*.jar', fingerprint: true
                }
            }
        }
    }
}
