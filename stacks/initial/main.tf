resource "aws_instance" "instance-1" {
  ami = "ami-07caf09b362be10b8" # Amazon Linux
  instance_type = "t2.micro"

  tags = {
    Name = "terramate-example-second-try"
  }
}