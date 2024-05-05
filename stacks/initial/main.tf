resource "aws_instance" "instance-1" {
  ami = "ami-0fe630eb857a6ec83" # Amazon Linux
  instance_type = "t2.micro"

  tags = {
    Name = "terramate-example"
  }
}