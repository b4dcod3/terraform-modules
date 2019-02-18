pipeline {  
    agent none
    parameters {
        string(description: 'S3 Bucket for terraform states', name: 's3_bucket'),
        string(description: 'AWS region', name: 'aws_region'),
        string(description: 'Environment test, staging, prod', name: 'environment')
    }
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
                    tfIinit "${s3_bucket}" "${environment}" "${aws_region}"
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