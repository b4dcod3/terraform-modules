#!groovy
pipeline {
    parameters{
        string(defaultValue: '', description: 'AWS S3 bucket for remote statefiles', name: 's3_bucket')
        string(defaultValue: '', description: 'Test, Prod, Stage etc', name: 'environment')
        string(defaultValue: '', description: 'AWS region', name: 'aws_region')
        booleanParam(defaultValue: false, description: 'Run Terraform plan?', name: 'tf_plan')
        booleanParam(defaultValue: false, description: 'Run Terraform destroy?', name: 'tf_destroy')
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
                tfInit "${s3_bucket}","${environment}","${aws_region}"
            }
        }
        stage ('Terraform Plan') {
            agent { node 'slave1' }
            steps {
                tfPlan "${environment}"
            }
        }
        stage ('Terraform Apply') {
            agent { node 'slave1' }
            when {
                environment name: 'tf_plan', value: 'false' 
            }
            steps {
                tfApply()
            }
        }
        stage ('Terraform Apply') {
            agent { node 'slave1' }
            when {
                environment name: 'tf_destroy', value: 'true' 
            }
            steps {
                tfDestroy()
            }
        }
    }
}  