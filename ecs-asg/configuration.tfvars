##
# Some of these variables may be removed from this file if the default value exists
# For better understanding, let's specify all variables explicitly here
##
name_prefix = "aho-sf-vwis"
aws_region = "eu-west-1"
ecs_image_id.eu-west-1 = "ami-64c4871d"
count_jks_agent = 2
desired_capacity_on_demand = 2
ec2_key_name = "aho-sf-vwis"
instance_type = "t2.micro"
minimum_healthy_percent_jks_agent = 50

##
# This is a sample (public) Docker image from which can be accessed at https://github.com/docker-training/webapp
# This sample image utilizes Flask and it's not RECOMMENDED to run it directly in production (performance degradation)
# This web server binds to port 5000
##
#webapp_docker_image_name = "training/webapp"
#webapp_docker_image_tag = "latest"

##
# These variables are required, please fill it out with your environment outputs
##
#sg_jks_agent_instances_id = "sg-2f206155"
#sg_jks_sa_id = "sg-0062247a"
#vpc_id = "vpc-7b853a1d"
#subnet_ids = "subnet-c82a2293,subnet-c39a54a5"

#ecs_instance_profile = "arn:aws:iam::235960612000:instance-profile/aho-vwis-dev_ecs_instance_profile"
#ecs_service_role = "aho-vwis-dev_ecs_service_role"

