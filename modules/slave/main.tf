resource "aws_subnet" "slave_private_subnet" {
  vpc_id     = "vpc-08c07fc88ec42d090"
  cidr_block = var.master_cidr_block

  tags = {
    Name = "${var.client_name}_slave_subnet"
  }
}

resource "aws_instance" "slave_instance" {
  ami = "ami-07caf09b362be10b8" # Amazon Linux
  instance_type = var.instance_type
  subnet_id     = aws_subnet.slave_public_subnet.id

  security_groups = [ aws_security_group.allow_internet_traffic ]
  
  tags = {
    Name = "${var.client_name}_slave_instance"
  }
}

resource "aws_security_group" "allow_internet_traffic" {
  name        = "${var.client_name}_slave"
  description = "Allow inbound traffic and all outbound traffic to the master of ${var.client_name}"
  vpc_id      = "vpc-08c07fc88ec42d090"

  tags = {
    Name = "${var.client_name}_slave"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ingress_from_master" {
  security_group_id = var.slave_sg_id
  referenced_security_group_id = var.master_sg_id
  ip_protocol       = "-1"
}

# Regla de egress
