resource "aws_subnet" "master_public_subnet" {
  vpc_id     = "vpc-08c07fc88ec42d090"
  cidr_block = var.master_cidr_block

  tags = {
    Name = "${var.client_name}_master_subnet"
  }
}

resource "aws_instance" "test_module_instance" {
  ami = "ami-07caf09b362be10b8" # Amazon Linux
  instance_type = var.instance_type
  subnet_id     = aws_subnet.master_public_subnet.id

  security_groups = [ var.master_sg_id ]
  
  tags = {
    Name = "${var.client_name}_master_instance"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_internet_traffic_global" {
  security_group_id = var.master_sg_id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "allow_slave_ingress" {
  security_group_id = var.master_sg_id
  referenced_security_group_id = var.slave_sg_id
  ip_protocol       = "-1"
}

# regla de egress

resource "aws_subnet" "master_public_subnet" {
  vpc_id     = "vpc-08c07fc88ec42d090"
  cidr_block = var.master_cidr_block

  tags = {
    Name = "${var.client_name}_master_subnet"
  }
}

resource "aws_instance" "test_module_instance" {
  ami = "ami-07caf09b362be10b8" # Amazon Linux
  instance_type = var.instance_type
  subnet_id     = aws_subnet.master_public_subnet.id

  security_groups = [ aws_security_group.allow_internet_traffic ]
  
  tags = {
    Name = "${var.client_name}_master_instance"
  }
}

resource "aws_security_group" "allow_internet_traffic" {
  name        = "${var.client_name}_allow_internet_traffic"
  description = "Allow inbound traffic and all outbound traffic to the master of ${var.client_name}"
  vpc_id      = "vpc-08c07fc88ec42d090"

  tags = {
    Name = "${var.client_name}_allow_internet_traffic"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_slave_ingress" {
  security_group_id = var.slave_sg_id
  referenced_security_group_id = var.master_sg_id
  ip_protocol       = "-1"
}

# Regla de egress

resource "aws_security_group" "allow_internet_traffic_master" {
  name        = "${var.client_name}_allow_internet_traffic"
  description = "Allow inbound traffic and all outbound traffic to the master of ${var.client_name}"
  vpc_id      = "vpc-08c07fc88ec42d090"

  tags = {
    Name = "${var.client_name}_allow_internet_traffic"
  }
}

resource "aws_security_group" "allow_master_traffic_slave" {
  name        = "${var.client_name}_allow_internet_traffic"
  description = "Allow inbound traffic and all outbound traffic to the master of ${var.client_name}"
  vpc_id      = "vpc-08c07fc88ec42d090"

  tags = {
    Name = "${var.client_name}_allow_internet_traffic"
  }
}