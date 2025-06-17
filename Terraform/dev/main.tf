# Networking

module "vpc" {
  source   = "../modules/netwoking/vpc"
  vpc_cidr = var.vpc_cidr
  name     = var.name
}

module "subnets" {
  source          = "../modules/netwoking/subnets"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  name            = var.name
  azs             = var.azs
}

module "igw" {
  source = "../modules/netwoking/igw"
  vpc_id = module.vpc.vpc_id
  name   = var.name
}

module "routeTables" {
  source          = "../modules/netwoking/routeTables"
  vpc_id          = module.vpc.vpc_id
  name            = var.name
  public_subnets  = module.subnets.public_subnets
  private_subnets = module.subnets.private_subnets
  Igw_id          = module.igw.Igw_id
}

# Security Group

module "sg" {
  source          = "../modules/sg"
  vpc_id          = module.vpc.vpc_id
  ssh_allowed_ips = var.ssh_allowed_ips
  db_port         = var.db_port
}

# EC2-ASG
module "ec2_asg" {
  source         = "../modules/ec2-asg"
  name           = var.name
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  asg_min_size   = var.asg_min_size
  asg_max_size   = var.asg_max_size
  public_subnets = module.subnets.public_subnets
}

module "rds" {
  source                  = "../modules/rds"
  engine                  = var.engine
  engine_version          = var.engine_version
  name                    = var.name
  db_name                 = var.db_name
  db_password             = var.db_password
  db_user                 = var.db_user
  allocated_storage       = var.allocated_storage
  instance_class          = var.instance_class
  backup_retention_period = var.backup_retention_period
  private_subnets         = module.subnets.private_subnets
  rds_sg                  = module.sg.rds_sg
}

# ECR
module "ecr" {
  source    = "../modules/ecr"
  repo_name = var.repo_name
  name      = var.name
}

# IAM
module "iam" {
  source          = "../modules/iam"
  role_name       = var.role_name
  account_id      = var.account_id
  rds_instance_id = var.rds_instance_id
  db_username     = var.db_username
  region          = var.region
}

# ACM
module "acm" {
  source      = "../modules/acm"
  domain_name = var.domain_name
}

# ALB
module "alb" {
  source          = "../modules/alb"
  vpc_id          = module.vpc.vpc_id
  alb_sg          = module.sg.alb_sg
  certificate_arn = module.acm.certificate_arn
  public_subnets  = module.subnets.public_subnets
  name            = var.name
  lb_type         = var.lb_type
}