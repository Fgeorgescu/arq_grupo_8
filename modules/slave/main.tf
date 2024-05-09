resource "aws_subnet" "slave_public_subnet" {
  vpc_id     = "vpc-07d4e8828e405ba5b"
  cidr_block = var.slave_cidr_block

  tags = {
    Name = "${var.client_name}_slave_subnet"
    #Client = "${var.client_name}"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_from_master_sg" {
  security_group_id = var.slave_sg_id
  referenced_security_group_id = var.master_sg_id
  description = "Ingress rule that allow the slave to communicate with the master instance"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "egress_from_master_sg" {
  security_group_id = var.slave_sg_id
  referenced_security_group_id = var.master_sg_id
  description = "Egress rule that allow the slave to communicate with the master instance"
  ip_protocol       = "-1"
}

# Regla de egress

resource "aws_launch_template" "slave_launch_template" {
  name_prefix   = "${var.client_name}_template"
  image_id      = "ami-07caf09b362be10b8"
  instance_type = var.instance_type
  vpc_security_group_ids = [var.slave_sg_id]

  tag_specifications {
      resource_type = "instance"

      tags = {
        Name = "${var.client_name}"
        Client = "${var.client_name}"
      }
    }
}


resource "aws_autoscaling_group" "slave_asg" {
  name = "${var.client_name}_asg"
  availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  launch_template {
    id      = aws_launch_template.slave_launch_template.id
    version = "$Latest"
  }
}
