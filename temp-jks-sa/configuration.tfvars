##
# Some of these variables may be removed from this file if the default value exists
# For better understanding, let's specify all variables explicitly here
##
name_prefix = "aho-sf-vwis"
aws_region = "eu-west-1"
ecs_image_id.ap-northeast-1 = "ami-d834aba1"
ec2_key_name = "aho-sf-vwis"
instance_type = "t2.micro"
desired_capacity_on_demand = 1

##
# These variables are required, please fill it out with your environment outputs
##
sg_jks_sa_id = "${data.terraform_remote_state.aws_security_group.jks_sa}"
vpc_id = "${data.terraform_remote_state.aws_vpc.main}"
subnet_ids = "subnet-c82a2293,subnet-c39a54a5"

ecs_instance_profile = "arn:aws:iam::235960612000:instance-profile/aho-vwis-dev_ecs_instance_profile"
ecs_service_role = "aho-vwis-dev_ecs_service_role"
