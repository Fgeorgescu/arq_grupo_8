resource "aws_security_group" "master_sg" {
  name        = "${var.client_name}_master_sg"
  description = "Allow inbound traffic and all outbound traffic to the master of ${var.client_name}"
  vpc_id      = "vpc-077ad65459ac463e4"

  tags = {
    Name = "${var.client_name}_master_sg"
    Client = "${var.client_name}"
  }
}

resource "aws_security_group" "slave_sg" {
  name        = "${var.client_name}_slave_sg"
  description = "Segurity group for the slave structure of the client ${var.client_name}"
  vpc_id      = "vpc-077ad65459ac463e4"

  tags = {
    Name = "${var.client_name}_slave_sg"
    Client = "${var.client_name}"
  }
}