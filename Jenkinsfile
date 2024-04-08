pipeline {
    agent any
    environment {
        MAVEN_HOME = tool 'Maven3'
        JAVA_HOME = tool 'Java22'
    }
    stages {
        stage('Compile Code') {
            steps {
                // Use bat instead of sh for Windows commands
                bat 'mvn clean install -DskipTests'
            }
        }
        stage('Run Tests') {
            steps {
                bat 'mvn test'
            }
        }
        // Ensure you have Docker commands available on Windows if you're using Docker steps
        stage('Build Docker Image') {
            steps {
                script {
                    // Docker commands can remain the same; ensure Docker CLI is available on Windows
                    bat "docker build -t my-spring-petclinic:${env.BUILD_NUMBER} ."
                }
            }
        }
    }
}
