# Provider Region
variable "region" {}

# VPC
variable "vpc_cidr" {}
variable "name" {}

# Subnets
variable "public_subnets" {}
variable "azs" {}
variable "private_subnets" {}

# Security Groups
variable "ssh_allowed_ips" {}
variable "db_port" {}

# IAM
variable "role_name" {}
variable "account_id" {}
variable "rds_instance_id" {}
variable "db_username" {}

# EC2-ASG
variable "ami_id" {}
variable "instance_type" {}
variable "asg_min_size" {}
variable "asg_max_size" {}

# RDS
variable "engine" {}
variable "engine_version" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "allocated_storage" {}
variable "instance_class" {}
variable "backup_retention_period" {}

# ECR
variable "repo_name" {}

# ACM
variable "domain_name" {}

# ALB
variable "lb_type" {}
