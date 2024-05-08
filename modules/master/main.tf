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