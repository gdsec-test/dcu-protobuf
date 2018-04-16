#!groovy

@Library('ECM@master') _

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source'
                checkout scm
            }
        }
        stage('Generating stub files') {
            steps {
                echo 'Building..'
                sh ./build.sh
            }
        }
    }
}