pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    docker.image('openjdk:11').inside {
                        // Используем переменную окружения WORKSPACE для указания рабочего каталога
                        sh 'git clone https://github.com/Kitchenez/task2.git ${WORKSPACE}/project'
                        sh "cd ${WORKSPACE}/project && ./gradlew build"
                    }
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: 'project/build/libs/*.jar', fingerprint: true
                }
            }
        }
    }
}
