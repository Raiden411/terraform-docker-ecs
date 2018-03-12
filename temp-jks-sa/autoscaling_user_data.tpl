#!/bin/bash
set -x
set -e

# Update instance
yum update -y

# Add all things that you want to do here (logging, monitoring, credential from S3, etc)

# Join ECS cluster
#yum install jenkins -y
#yum install maven -y

yum install wget -y
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins nginx -y
yum install java-1.8.0-openjdk.x86_64
service jenkins start 
service nginx start
chkconfig jenkins on
chkconfig nginx on

