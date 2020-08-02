#!/bin/bash


echo “Installing Dependencies”;

sudo yum install -y epel-release
sudo setenforce 0
sudo yum install -y java-1.8.0-openjdk-devel


sudo curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins
sudo systemctl start jenkins

echo “Jenkins installed now open your browser and navigate to http://your_ip_or_domain:8080"

cat /var/lib/jenkins/secrets/initialAdminPassword

echo “copy the initial password to unlock and start accessing jenkins”
