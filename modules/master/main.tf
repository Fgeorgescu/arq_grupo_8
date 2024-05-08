
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}

resource "aws_instance" "test_module_instance" {
  ami = "ami-07caf09b362be10b8" # Amazon Linux
  instance_type = "t2.micro"

  tags = {
    Name = "${var.instance_name}"
  }
}