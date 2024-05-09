resource "aws_security_group" "master_sg_original" {
  name        = "original_implementation_master_sg"
  description = "Allow inbound traffic and all outbound traffic to the master of original_implementation"
  vpc_id      = "vpc-07d4e8828e405ba5b"

  tags = {
    Name = "original_implementation_master_sg"
    Client = "original_implementation"
  }
}

resource "aws_security_group" "slave_sg_original" {
  name        = "original_implementation_slave_sg"
  description = "Segurity group for the slave structure of the client original_implementation"
  vpc_id      = "vpc-07d4e8828e405ba5b"

  tags = {
    Name = "original_implementation_slave_sg"
    Client = "original_implementation"
  }
}

resource "aws_subnet" "original_subnet" {
  vpc_id     = "vpc-07d4e8828e405ba5b"
  cidr_block = "172.31.144.0/20"
  
  tags = {
    Name = "original_implementation_master_subnet"
    Client = "original_implementation"
  }
}

resource "aws_instance" "master_instance" {
  ami = "ami-07caf09b362be10b8" # Amazon Linux
  instance_type = "t2.large"
  subnet_id     = aws_subnet.original_subnet.id

  security_groups = [ aws_security_group.master_sg_original.id ]
  
  tags = {
    Name = "original_implementation_master_instance"
    Client = "original_implementation"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_internet_traffic_global" {
  security_group_id = aws_security_group.master_sg_original.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "allow_slave_ingress" {
  security_group_id = aws_security_group.master_sg_original.id
  referenced_security_group_id = aws_security_group.slave_sg_original.id
  ip_protocol       = "-1"
}

# regla de egress

resource "aws_vpc_security_group_egress_rule" "allow_slave_egress" {
  security_group_id = aws_security_group.master_sg.id
  referenced_security_group_id = aws_security_group.slave_sg_original.id
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "ingress_from_master_sg" {
  security_group_id = aws_security_group.slave_sg_original.id
  referenced_security_group_id = aws_security_group.master_sg_original.id
  description = "Ingress rule that allow the slave to communicate with the master instance"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "egress_from_master_sg" {
  security_group_id = aws_security_group.slave_sg_original.id
  referenced_security_group_id = aws_security_group.master_sg_original.id
  description = "Egress rule that allow the slave to communicate with the master instance"
  ip_protocol       = "-1"
}

# Regla de egress

resource "aws_launch_template" "slave_launch_template" {
  name_prefix   = "original_implementation_template"
  image_id      = "ami-07caf09b362be10b8"
  instance_type = "t2.small"
  vpc_security_group_ids = [aws_security_group.slave_sg_original.id]

  tag_specifications {
      resource_type = "instance"

      tags = {
        Name = "original_implementation"
        Client = "original_implementation"
      }
    }
}


resource "aws_autoscaling_group" "slave_asg" {
  name = "original_implementation_asg"
  availability_zones = ["us-east-1a", "us-east-1b"]
  desired_capacity   = 2
  max_size           = 2
  min_size           = 0

  launch_template {
    id      = aws_launch_template.slave_launch_template.id
    version = "$Latest"
  }
}
