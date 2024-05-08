resource "aws_instance" "test_module_instance" {
  ami = "ami-07caf09b362be10b8" # Amazon Linux
  instance_type = var.instance_type

  tags = {
    Name = "${var.instance_name}"
  }
}