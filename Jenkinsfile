pipeline {
    agent any
    environment {
        MAVEN_HOME = tool 'Maven3'
        JAVA_HOME = tool 'Java22'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Compile Code') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-spring-petclinic:${env.BUILD_NUMBER}")
                }
            }
        }
    }
}
