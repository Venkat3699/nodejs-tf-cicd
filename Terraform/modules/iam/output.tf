output "role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.app_role.name
}

output "role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.app_role.arn
}