/**
  * We will allow trafic from JKS Master and outgoing connections
  */
resource "aws_security_group" "jks_agent" {
  name        = "${var.name_prefix}-jks_agent"
  vpc_id      = "${aws_vpc.main.id}"
  description = "Security group for JKS agents"

  tags {
    Name = "${var.name_prefix}-jks_agent"
  }
}

resource "aws_security_group_rule" "allow_ssh_from_internet_to_jks-agent" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.jks_agent.id}"
}

resource "aws_security_group_rule" "allow_http_from_internet_to_jks-agent" {
  type                     = "ingress"
  from_port                = 5000
  to_port                  = 5000
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.jks_sa.id}"
  security_group_id        = "${aws_security_group.jks_agent.id}"
}

/* Allow all outgoing connections */
resource "aws_security_group_rule" "allow_all_egress_to_jks-agent" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.jks_agent.id}"
}

/**
  * Security group for each jks stand alone
  */

resource "aws_security_group" "jks_sa" {
  name        = "${var.name_prefix}-jks_sa"
  vpc_id      = "${aws_vpc.main.id}"
  description = "Security group for jenkins stand alone"

  tags {
    Name = "${var.name_prefix}-jks-sa"
  }
}

resource "aws_security_group_rule" "allow_ssh_from_internet_to_jks-sa" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.jks_sa.id}"
}

resource "aws_security_group_rule" "allow_http_from_internet_to_jks-sa" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.jks_sa.id}"
}

/* Allow all outgoing connections */
resource "aws_security_group_rule" "allow_all_egress_to_jks-sa" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.jks_sa.id}"
}

/**
  * We will utilize ELB and allow web access only from ELB
  */
resource "aws_security_group" "webapp_albs" {
  name        = "${var.name_prefix}-webapp-albs"
  vpc_id      = "${aws_vpc.main.id}"
  description = "Security group for ALBs"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name_prefix}-webapp"
  }
}

#######################################################################################
### OLD
#######################################################################################


/**
# Security group for each instances
  
resource "aws_security_group" "webapp_instances" {
  name        = "${var.name_prefix}-webapp-instances"
  vpc_id      = "${aws_vpc.main.id}"
  description = "Security group for instances"

  tags {
    Name = "${var.name_prefix}-webapp"
  }
}

# Allow all outgoing connections 
resource "aws_security_group_rule" "allow_all_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.webapp_instances.id}"
}

# Allow incoming requests from ELB and peers only 
resource "aws_security_group_rule" "allow_all_from_albs" {
  type      = "ingress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"

  security_group_id        = "${aws_security_group.webapp_instances.id}"
  source_security_group_id = "${aws_security_group.webapp_albs.id}"
}

resource "aws_security_group_rule" "allow_all_from_peers" {
  type      = "ingress"
  from_port = 0
  to_port   = 0
  protocol  = "-1"

  security_group_id        = "${aws_security_group.webapp_instances.id}"
  source_security_group_id = "${aws_security_group.webapp_instances.id}"
}


# In production, it's recommended to remove SSH access to the instance
# (Comment the following lines out)
# 
resource "aws_security_group_rule" "allow_ssh_from_internet" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.webapp_instances.id}"
}

*/

