output "rds_subnet_group_name" {
  description = "Name of the RDS Subnet Group"
  value       = aws_db_subnet_group.rds_subnet_group.name
}

# Output for RDS Instance Endpoint
output "rds_instance_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.rds_instance.endpoint
}
