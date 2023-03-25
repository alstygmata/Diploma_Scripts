#!/bin/bash

sudo su

sudo yum update -y

sudo yum upgrade

curl -LO https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz

sudo tar -xvzf amazon-corretto-11-x64-linux-jdk.tar.gz -C /usr/java/:wq

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install jenkins -y

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo ufw enable
sudo ufw allow 8080

sudo yum install docker -y 

sudo usermod -a -G docker ec2-user

id ec2-user

newgrp docker

wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 

sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose

sudo chmod -v +x /usr/local/bin/docker-compose

sudo systemctl enable docker.service

sudo systemctl start docker.service
