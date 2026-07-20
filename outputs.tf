output "security_group_id" {
  description = "ID of the security group attached to the Tailscale instances"
  value       = aws_security_group.this.id
}

output "autoscaling_group_id" {
  description = "ID of the Tailscale autoscaling group"
  value       = aws_autoscaling_group.this.id
}

output "autoscaling_group_name" {
  description = "Name of the Tailscale autoscaling group"
  value       = aws_autoscaling_group.this.name
}

output "launch_template_id" {
  description = "ID of the launch template used by the Tailscale autoscaling group"
  value       = aws_launch_template.this.id
}

output "iam_role_arn" {
  description = "ARN of the IAM role attached to the Tailscale instances"
  value       = aws_iam_role.tailscale_role.arn
}
