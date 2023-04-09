pipeline{
    agent any
    stages{
        stage("Git Checkout"){
            steps{
                echo "========executing A========"
                git branch: 'main', url: 'https://github.com/ashitosh2612/demo_project.git'
            }
            
        }
        stage("UNIT Testing"){
            steps{
                sh 'mvn test'  
            }
            
        }
         stage("Integration testing"){
            steps{
                echo "======This is for Integration testing that are we performing=========="
                sh 'mvn verify -DskipUnitTests'  
            }
            
        }
    stage("Maven Build"){
            steps{
                echo "======clear previous artifact=========="
                sh 'mvn clean install'  
            }

    }
    
    stage('SonarQube analysis'){
            steps{
                    script{
                        withSonarQubeEnv(credentialsId: 'sonar') {
                        echo "======sonar qube integration testing=========="
                        sh 'mvn clean package sonar:sonar'
                            }    
                    }
  
                  }

        }
stage('Quality gate status'){
    steps{
        script{
            waitForQualityGate abortPipeline: false, credentialsId: 'sonar'
        }
    }
}

}
}