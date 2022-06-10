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
    stage('Terraform init stage'){
        steps {
           withAWS(credentials: 'workdaycred', region: 'eu-west-1') {
                 sh 'terraform init'
                 }
               }
            }
    stage('Terraform Apply'){
        steps {
           withAWS(credentials: 'workdaycred', region: 'eu-west-1') {
                sh 'terraform apply -auto-approve'
                }
              }
           }
        }
   }