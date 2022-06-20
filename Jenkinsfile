pipeline{
    agent any
    tools {
        terraform 'terraform-workday'
    }
    stages{
        stage('Source Code'){
            steps{
                git branch: 'main', credentialsId: 'workdaygithub', url: 'https://github.com/eaglesentz/project-workday'
           }
        }
    stage('Terraform Init Stage'){
        steps {
           withAWS(credentials: 'workdaycred', region: 'eu-west-1') {
                 sh 'terraform init'
                 sh 'terraform plan'
                 }
               }
            }

    stage('Prompte to PROD?') {
        steps {
           timeout(time: 2, unit: 'DAYS') {
              input 'Do you want to Approve the plan?'
              }
           }
        }
    stage('Terraform Apply Stage'){
        steps {
           withAWS(credentials: 'workdaycred', region: 'eu-west-1') {
                sh 'terraform destroy -auto-approve'
                }
              }
           }
        }
   }
