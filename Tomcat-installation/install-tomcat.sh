#!/bin/bash
# TOMCAT.SH
# Steps for Installing tomcat9 on rhel9
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
# https://github.com/LandmakTechnology/package-management/tree/main/Tomcat-installation

# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
sudo hostnamectl set-hostname tomcat
cd /opt 
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
# install wget unzip packages.
sudo yum install wget unzip -y
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.zip
sudo unzip apache-tomcat-9.0.97.tar.gz
sudo rm -rf apache-tomcat-9.0.97.tar.gz
### rename tomcat for good naming convention
sudo mv apache-tomcat-9.0.97 tomcat9
### assign executable permissions to the tomcat home directory
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
### start tomcat
sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat
# This will enable us to manage tomcat as a service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
starttomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 

#Tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat9/conf/server.xml
vi /opt/tomcat9/webapps/manager/META-INF/context.xml
vi /opt/tomcat9/conf/tomcat-user.xml  # to add user

	<user username="admin" password="admin123" roles="manager-gui,admin-gui"/>
	

/opt/tomcat9/conf/context.xml

 vi /opt/tomcat9/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat9/conf/tomcat-user.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	
