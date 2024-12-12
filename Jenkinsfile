// Jenkins file for Andrew Warnock Coursework 2
pipeline {
	agent any
	environment {
		DOCKERHUB_CRED = credentials("182a89e2-f029-4220-9fcc-274b73e83b40");
	}
	stages{
		stage("Build Docker image") {
			steps {
				echo ' Building Docker image...'
				echo ' ================================'
				sh 'docker build --tag vividsoushi/cw2:latest .'
			}
		}
		stage("Test Docker image"){
			steps{
				echo ' Testsing Docker Image....'
                    		echo ' ================================'
				sh 'docker image inspect vividsoushi/cw2:latest'
				sh 'docker run --name coursework2 -p 8080:8080 -d vividsoushi/cw2:latest'
				sh 'docker stop coursework2'
				sh 'docker rm coursework2'
			}
		}
		stage("Push Docker image to DockerHub"){
			steps{
                        	echo ' Pushing Image to Dockerhub....'
                        	echo ' ================================'

				sh 'echo $DOCKERHUB_CRED_PSW | docker login -u $DOCKERHUB_CRED_USR --password-stdin'
				sh 'docker push vividsoushi/cw2:latest'
			}
		}
		stage("Deploy Application") {
			steps {
                        	echo ' Deploying Application....'
                        	echo ' ================================'

				sshagent(['id_rsa.pub']){
					sh 'ssh ubuntu@34.201.100.69'
					sh 'ansible-playbook playbook.yml'
				}
			}
		}
	}
}