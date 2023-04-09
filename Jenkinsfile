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
//stage('Quality Gate status'){
  //          steps{
    //                script{
      //                  waitForQualityGate abortPipeline: false, credentialsId: 'sonar'
        //            }
  
          //        }
        //}
     stage('upload war file to nextus'){
        steps{
            script{
                def readPomVersion = readMavenPom file: 'pom.xml'
                def nexusRepo = readPomVersion.version.endWith("SNAPSHOT") ? "demoapp-snapshot" : "demoapp-release"
                nexusArtifactUploader artifacts: 
                [
                    [
                        artifactId: 'springboot',
                         classifier: '',
                        file: 'target/Uber.jar',
                         type: 'jar'
                         ]
                ],
                         credentialsId: 'nexus-auth',
                         groupId: 'com.example',
                         nexusUrl: '35.203.34.228:8081', 
                         nexusVersion: 'nexus3', 
                         protocol: 'http',
                         repository: nexusRepo,
                         version: "${readPomVersion.version}"
            }
        }
     }

}
}
