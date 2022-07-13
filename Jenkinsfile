pipeline{
/*some changes*/ 
environment{
		registry = 'arijmansour/pfe_carts_microservices'
		registryCredential= 'Dockerhub'
		dockerImage = ''
	}
    agent any
    
    
    stages {
        stage('Checkout GIT') {
            steps {
                echo 'Pulling...';
                git branch: 'master', 
                url:'https://github.com/ArijMansour/carts_microservices.git';
            }
        }
        
        
        
        stage("Test, Build"){
            steps{
                sh "mvn clean install"
            }
        }
	stage("package"){
               steps{

                   sh "mvn package"
                    }

                  }
        
        
        stage('Building our image'){
			steps{ 
				script{ 
					dockerImage= docker.build registry + ":latest" 
				}
			}
		}

		stage('Deploy our image'){
			steps{ 
				script{
					docker.withRegistry( '', registryCredential){
						dockerImage.push()
					} 
				} 
			}
		}

 }
 post{
		success{
			emailext body: 'Build success', subject: 'Jenkins', to:'arijbenmansour1@gmail.com'
		}
		failure{
			emailext body: 'Build failure', subject: 'Jenkins', to:'arijbenmansour1@gmail.com'
		}

	}
 
}
