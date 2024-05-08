output "master_sg_id" {
  value     = aws_security_group.allow_internet_traffic_master.id
  sensitive = false
}

output "slave_sg_id" {
  value     = aws_security_group.allow_master_traffic_slave.id
  sensitive = false
}