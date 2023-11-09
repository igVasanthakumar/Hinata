pipeline {
   agent  any
    stages {
        stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/igVasanthakumar/Hinata.git']])
                        }
                    }
                }
            }
 
        stage('Plan') {
            steps {
                withAWS(credentials: 'FNeDZpZAp7GyhStEwCSE2pwLp1dKi4eLy8BGJ+HC') {
                    sh "pwd;cd terraform/ ; terraform init"
                    sh "pwd;cd terraform/ ; terraform fmt"
                    //sh "pwd;cd terraform/ ; terraform validate"
                  // sh "pwd;cd terraform/ ; terraform plan"
                }
            }
        }
 
        stage('Apply') {
            steps {
                withAWS(credentials: 'FNeDZpZAp7GyhStEwCSE2pwLp1dKi4eLy8BGJ+HC') {
                    sh "pwd;cd terraform/ ; terraform apply --auto-approve"
                }
            }
        }
    }
 
  }
