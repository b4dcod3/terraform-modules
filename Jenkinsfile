#!groovy
pipeline {
    parameters{
        string(defaultValue: '', description: 'test', name: 's3_bucket')
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
                    tfInit "${s3_bucket}" "${environment}" "${aws_region}"
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