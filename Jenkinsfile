pipeline { 
    parameters{[
        string(name: 'RELEASE_VERSION', defaultValue: '1.0.0', description: 'Application git release tag version')
    ]}
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