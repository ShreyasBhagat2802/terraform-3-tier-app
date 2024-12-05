# Frontend Security Group ID
output "frontend_sg_id" {
  description = "ID of the Frontend security group"
  value       = aws_security_group.frontend_sg.id
}

# Backend Security Group ID
output "backend_sg_id" {
  description = "ID of the Backend security group"
  value       = aws_security_group.backend_sg.id
}

# RDS Security Group ID
output "rds_sg_id" {
  description = "ID of the RDS security group"
  value       = aws_security_group.rds_sg.id
}
