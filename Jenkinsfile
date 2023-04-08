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
    }
    
    
}