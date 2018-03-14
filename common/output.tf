/* Security group */
output "sg_jks_agent_id" {
  value = "${aws_security_group.jks_agent.id}"
}

output "sg_jks_sa_id" {
  value = "${aws_security_group.jks_sa.id}"
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

/* Subnet IDs */
output "subnet_ids" {
  value = ["${aws_subnet.subnet.*.id}"]
}
