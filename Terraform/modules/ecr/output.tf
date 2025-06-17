output "repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.ecr_repo.repository_url
}

output "repository_arn" {
  description = "ARN of the ECR repository"
  value       = aws_ecr_repository.ecr_repo.arn
}