# Output variable definitions

output "slave_sg_id" {
    value = aws_security_group.allow_internet_traffic.id
  
}