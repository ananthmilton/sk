pipeline {
    agent any

//	tools {
//		jdk 'jdk8'
//	}
//	environment {
//		M2_INSTALL = "/usr/bin/mvn"
//	}

    stages {
        stage('Clone-Repo') {
	    	steps {
	        	checkout scm
	    	}
        }

        stage('Build') {
            steps {
                sh 'mvn install -Dmaven.test.skip=true'
            }
        }
		
        stage('Unit Tests') {
            steps {
                sh 'mvn compiler:testCompile'
                sh 'mvn surefire:test'
                junit 'target/**/*.xml'
            }
        }

        stage('Deployment') {
            steps {
                sh 'sshpass -p "ananth@123" scp target/gamutkart.war gam@172.17.0.2:/home/gam/Distros/apache-tomcat-9.0.89/webapps'
                sh 'sshpass -p "ananth@123" ssh gam@172.17.0.2 "/home/gam/Distros/apache-tomcat-9.0.89/bin/startup.sh"'
            }
        }
    }
}
