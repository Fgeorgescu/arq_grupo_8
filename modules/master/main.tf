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
