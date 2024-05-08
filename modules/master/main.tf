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

resource "aws_vpc_security_group_ingress_rule" "allow_internet_traffic_global" {
  security_group_id = aws_security_group.allow_internet_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
