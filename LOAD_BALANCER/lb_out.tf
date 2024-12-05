output "backend_lb_arn" {
  description = "The ARN of the backend load balancer"
  value       = aws_lb.backend.arn
}

output "backend_lb_dns_name" {
  description = "The DNS name of the backend load balancer"
  value       = aws_lb.backend.dns_name
}

output "backend_lb_listener_arn" {
  description = "The ARN of the backend load balancer listener"
  value       = aws_lb_listener.backend.arn
}

output "frontend_lb_arn" {
  description = "The ARN of the frontend load balancer"
  value       = aws_lb.frontend.arn
}

output "frontend_lb_dns_name" {
  description = "The DNS name of the frontend load balancer"
  value       = aws_lb.frontend.dns_name
}

output "frontend_lb_listener_arn" {
  description = "The ARN of the frontend load balancer listener"
  value       = aws_lb_listener.frontend.arn
}
