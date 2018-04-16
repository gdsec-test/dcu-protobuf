#!groovy

pipeline {
    agent any

    stages {
        stage('Checking out source') {
            checkout scm
        }
        stage('Building stub files') {
            steps {
                echo 'Building....'
                sh('build.sh')
            }
        }
    }
}