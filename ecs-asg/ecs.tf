/* Cluster definition, which is used in autoscaling.tf */
resource "aws_ecs_cluster" "jks_agent_cluster" {
  name = "${var.name_prefix}_jks_agent_cluster"
}
