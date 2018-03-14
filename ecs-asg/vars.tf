/* Terraform constraints */
terraform {
  required_version = ">= 0.11, < 0.12"
}

variable "name_prefix" {
  default     = "tutorial"
  description = "Name prefix for this environment."
}

variable "aws_region" {
  default     = "ap-northeast-1"
  description = "Determine AWS region endpoint to access."
}

/* ECS optimized AMIs per region */
variable "ecs_image_id" {
  # ami-2017.09.i with ECS Agent 1.17.1-1 and Docker 17.09.1-ce
  default = {
    ap-northeast-1 = "ami-68ef940e"
    ap-southeast-1 = "ami-0a622c76"
    eu-west-1      = "ami-0693ed7f"
    us-east-1      = "ami-a7a242da"
    us-west-1      = "ami-9ad4dcfa"
    us-west-2      = "ami-92e06fea"
  }
}

variable "jks_agent_docker_image_name" {
  default     = "training/jks_agent_docker_image"
  description = "Docker image from Docker Hub"
}

variable "jks_agent_docker_image_tag" {
  default     = "latest"
  description = "Docker image version to pull (from tag)"
}

variable "count_jks_agent" {
  default     = 2
  description = "Number of jks_agent tasks to run"
}

variable "desired_capacity_on_demand" {
  default     = 2
  description = "Number of instance to run"
}

variable "ec2_key_name" {
  default     = ""
  description = "EC2 key name to SSH to the instance, make sure that you have this key if you want to access your instance via SSH"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type to use"
}

variable "minimum_healthy_percent_jks_agent" {
  default     = 50
  description = "ECS minimum_healthy_percent configuration, set it lower than 100 to allow rolling update without adding new instances"
}

/* Region settings for AWS provider */
provider "aws" {
  region = "${var.aws_region}"
}
