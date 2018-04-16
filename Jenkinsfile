#!groovy

pipeline {
    agent any

    stages {
        stage('Checking out source') {
            steps {
                checkout scm
            }
        }
        stage('Building stub files') {
            steps {
                echo 'Building....'
                sh "./build.sh"
            }
        }
    }
}