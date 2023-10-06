output "security_group_id" {
  description = "value"
  value       = aws_security_group.this.id
}

output "autoscaling_group_id" {
  description = "value"
  value       = aws_autoscaling_group.this.id
}
