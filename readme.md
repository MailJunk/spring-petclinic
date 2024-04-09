These instructions are for windows hosted machines.  This guide based off a 6 year old machine with no software installed.

Required software

Java Development Kit (JDK):
https://www.oracle.com/java/technologies/downloads/
x64 Installer for windows

Maven (Build Tool):
https://maven.apache.org/download.cgi
apache-maven-3.9.6-bin.zip
Set the M2_HOME environment variable.

Docker:
https://docs.docker.com/get-docker/
Docker Desktop for Windows

Jenkins:
https://www.jenkins.io/download/
Jenkins 2.440.2 LTS for Windows

Git:
https://git-scm.com/


Step 1:

Install Java Development Kit (JDK)
Run the installer: Accept the defaults during the installation.

Maven (Build Tool)
Extract the zip file and place it under c: root or program files

Search "Environment Variables": Press the Windows key, type "environment variables," and select "Edit the system environment variables."

Click "Environment Variables...": A window will pop up.

Under "System variables" click "New..."
Variable name: M2_HOME
Variable value: The path where you extracted Maven (e.g., C:\Program Files\apache-maven-3.8.6)
Click "OK".

Under "System variables," find the Path variable and click "Edit...".
Click "New" and add %M2_HOME%\bin.
Click "OK" on all windows to save changes.

Docker:
Run the installer: Accept the defaults during the installation.

Jenkins:
Run the installer: Accept the defaults during the installation.

Git:
Run the installer: Accept the defaults during the installation.


Step 2:

Open a new command prompt as admin.
java -version and press Enter. 

In the same command prompt, type mvn -version. 



Step 3:

Visited the Spring Petclinic repository on GitHub: https://github.com/spring-projects/spring-petclinic.
In the top right corner, click the "Fork" button. This will created a copy of the project in own GitHub account 


In command prompt as admin, navigate to c:\ root
type: mkdir projects
This is to make a folder/directory as c:\projects
type: cd projects

Clone the project: 
git clone https://github.com/MailJunk/spring-petclinic.git

Step 4:
This project doesn't have a Jenkinsfile nor Dockerfile.  two empty files created.

Step 5:
Setting up Jenkins vs http://localhost:9090/
Needed to change the port number to 9090 so it won't conflict with the project default port of 8080
Specified tool settings for Maven and JDK location
Named Maven as 'Maven3'
Named Java as  'Java22'
Setting up Pipeline for Spring project
Select "Pipeline script from SCM" in the "Pipeline" section.
Choose "Git".
Repository URL: https://github.com/MailJunk/spring-petclinic.git
Branches: */main
Script Path: Jenkinsfile

Step 6:
Opened up empty Jenkinsfile inside project folder (without any extension)
Added code inside to use the maven and java environment, compile code, run test and build docker image

Opened up empty Dockerfile
Added code to use Java17, set working directory into a container, copy jar file into container and host it on 8080 and run jar file

Step 7:
Setting up git
navigated to project directory
initialized git repository: git initialized
connected to remote repository:  git remote add origin https://github.com/MailJunk/spring-petclinic.git 
Ran command to add name and email
git add Dockerfile Jenkinsfile
git commit -m "Add Dockerfile and Jenkinsfile for pipeline"
git push origin main

Step 8:
Ran pipeline in Jenkins


