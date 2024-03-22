pipeline {
    agent any 
    stages {
        stage("Init") {
            steps{
                echo "Initialize"
            }
        }
        stage ("Build"){
            steps{
                sh 'mvn clean package'
                sh "docker build . -t tomcatwebapp:${env.BUILD_ID}"
            }
        }
        stage ("Deployement"){
            steps {
                echo "Deploy the application on cloud platform"
            }
        }
    }
}

