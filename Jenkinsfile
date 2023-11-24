pipeline {
    agent{
        label 'jdk-17'
    }

    triggers{
        pollSCM('* * * * *')
    }

    tools{
        jdk 'JDK'
    }

    stages{
        stage(VCS){
            steps{
                git url: 'https://github.com/Bhavana-2022/spring-docker-k8s.git',
                    branch: 'main'
            }
        }
        stage(build){
            steps{
                sh 'mvn package'
            }
        
        }
        stage(artifacts){
            steps{
                    archiveArtifacts artifacts: '**/**.jar'
                    junit testResults: '**/**.xml'
            }
        }
        

        stage(imagebuild){
            steps{
                sh 'docker image build -t mangarathi/exp:1.2 .'
            }
        }

        stage(pushdockerregistry){
            steps{
                script{
                    withCredentials([string(credentialsId: 'thisismykey', variable: 'mypasswd')]) {
                    sh 'docker login -u mangarathi -p ${mypasswd}'

                    sh 'docker push  mangarathi/exp:2.0'
                    }
                    
                }
            }
        }
        stage(deploy){
           steps{
                sh 'docker container run -d -P --name spring mangarathi/exp:2.0'
           }
        }    
    }
}



    
