output "master_sg_id" {
  value     = aws_security_group.master_sg.id
  sensitive = false
}

output "slave_sg_id" {
  value     = aws_security_group.slave_sg.id
  sensitive = false
}