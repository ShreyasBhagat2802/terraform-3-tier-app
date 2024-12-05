output "backend_launch_template_id" {
  description = "The ID of the backend launch template"
  value       = aws_launch_template.backend.id
}

output "backend_launch_template_name" {
  description = "The name of the backend launch template"
  value       = aws_launch_template.backend.name
}

output "frontend_launch_template_id" {
  description = "The ID of the frontend launch template"
  value       = aws_launch_template.frontend.id
}

output "frontend_launch_template_name" {
  description = "The name of the frontend launch template"
  value       = aws_launch_template.frontend.name
}
