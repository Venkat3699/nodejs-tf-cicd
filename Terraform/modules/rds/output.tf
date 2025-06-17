output "endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.app_db.endpoint
}
