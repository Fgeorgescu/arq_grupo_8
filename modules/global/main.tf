resource "aws_security_group" "allow_internet_traffic_master" {
  name        = "${var.client_name}_allow_internet_traffic_master"
  description = "Allow inbound traffic and all outbound traffic to the master of ${var.client_name}"
  vpc_id      = "vpc-08c07fc88ec42d090"

  tags = {
    Name = "${var.client_name}_allow_internet_traffic_master"
  }
}

resource "aws_security_group" "allow_master_traffic_slave" {
  name        = "${var.client_name}_slave_sg"
  description = "Allow inbound traffic and all outbound traffic to the master of ${var.client_name}"
  vpc_id      = "vpc-08c07fc88ec42d090"

  tags = {
    Name = "${var.client_name}_slave_sg"
  }
}