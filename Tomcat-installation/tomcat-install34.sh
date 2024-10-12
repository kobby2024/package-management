#!/bin/sh
# change hostname to tomcat
sudo hostnamectl set-hostname tomcat
#sudo su - ec2-user
cd /opt
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
sudo yum install git wget vim unzip -y
sudo yum install java-1.8.0-openjdk-devel -y
# install wget unzip packages.
sudo yum install wget unzip -y

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.zip
sudo unzip apache-tomcat-9.0.89.zip
sudo rm -rf apache-tomcat-9.0.89.zip
### rename tomcat for good naming convention
sudo mv apache-tomcat-9.0.89/ tomcat9
### assign executable permissions to the tomcat home directory
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
### Change tomcat port port from 8080 to 8081 
### curl -v localhost:8080
### curl -v IP:8080
### check if tomcat is running with--> ps -ef | grep tomcat 
### start tomcat
sh /opt/tomcat9/bin/startup.sh
#sh startup.sh = file not found
# create a soft link to start and stop tomcat from anywhere
# This will enable us to manage tomcat as a service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
starttomcat
sudo su - ec2-user
