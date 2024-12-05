output "backend_lb_security_group_id" {
  description = "The ID of the security group for the backend load balancer"
  value       = aws_security_group.backend_lb.id
}

output "backend_lb_security_group_name" {
  description = "The name of the security group for the backend load balancer"
  value       = aws_security_group.backend_lb.name
}

output "frontend_lb_security_group_id" {
  description = "The ID of the security group for the frontend load balancer"
  value       = aws_security_group.frontend_lb.id
}

output "frontend_lb_security_group_name" {
  description = "The name of the security group for the frontend load balancer"
  value       = aws_security_group.frontend_lb.name
}

