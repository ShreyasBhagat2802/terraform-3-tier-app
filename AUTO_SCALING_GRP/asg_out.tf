output "backend_autoscaling_group_name" {
  description = "The name of the backend Auto Scaling Group"
  value       = aws_autoscaling_group.backend.name
}

output "backend_autoscaling_group_arn" {
  description = "The ARN of the backend Auto Scaling Group"
  value       = aws_autoscaling_group.backend.arn
}

output "backend_autoscaling_policy_name" {
  description = "The name of the backend Auto Scaling policy"
  value       = aws_autoscaling_policy.backend_cpu.name
}

output "frontend_autoscaling_group_name" {
  description = "The name of the frontend Auto Scaling Group"
  value       = aws_autoscaling_group.frontend.name
}

output "frontend_autoscaling_group_arn" {
  description = "The ARN of the frontend Auto Scaling Group"
  value       = aws_autoscaling_group.frontend.arn
}

output "frontend_autoscaling_policy_name" {
  description = "The name of the frontend Auto Scaling policy"
  value       = aws_autoscaling_policy.frontend_cpu.name
}
