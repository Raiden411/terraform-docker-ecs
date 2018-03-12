#!/bin/bash
set -x
set -e

# Update instance
yum update -y

# Add all things that you want to do here (logging, monitoring, credential from S3, etc)

# Join ECS cluster
#yum install jenkins -y
#yum install maven -y

