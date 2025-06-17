region   = "ap-south-1"
vpc_cidr = "10.0.0.0/16"
name     = "dev"

# Subnets
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
azs             = ["ap-south-1a", "ap-south-1b"]

# Security Groups
ssh_allowed_ips = "157.50.113.219"
db_port         = "5432"

# IAM
role_name       = "AppInstanceRole"
account_id      = "682033479178"
rds_instance_id = "app-db"
db_username     = "admin"

# EC2-ASG
ami_id        = "ami-0e35ddab05955cf57" # Amazon Linux 2 AMI
instance_type = "t2.micro"
asg_min_size  = 2
asg_max_size  = 4

# RDS
engine                  = "postgres"
engine_version          = "13.4"
db_name                 = "mydb"
db_user                 = "admin"
db_password             = "securepassword123"
allocated_storage       = 20
instance_class          = "db.t3.micro"
backup_retention_period = 7

# ECR
repo_name = "nodejs-repo"

# ACM
domain_name = "venkatdevops.online"

# ALB
lb_type = "application"