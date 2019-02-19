#!groovy
pipeline {
    parameters{
        string(defaultValue: '', description: 'test', name: 's3_bucket')
        string(defaultValue: '', description: 'test', name: 'environment')
        string(defaultValue: '', description: 'test', name: 'aws_region')
    } 
    agent none
    stages {
        stage ('Configure AWS auth') {
            agent { node 'slave1' }
                steps {
                    awsAUTH()
                }
        }
        stage ('Terraform Init') {
            agent { node 'slave1' }
                steps {
                    tfInit 'test' 'test' 'test'
                }
        }
        stage ('Terraform Plan') {
            agent { node 'slave1' }
                steps {
                    tfPlan()
                }
        }
        stage ('Terraform Apply') {
            agent { node 'slave1' }
                steps {
                    tfApply()
                }
        }
    }
}  