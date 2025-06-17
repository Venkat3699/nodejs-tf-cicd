resource "aws_db_subnet_group" "db-subnetGroup" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "app_db" {
  identifier               = "${var.name}-db"
  allocated_storage        = var.allocated_storage
  storage_type             = "gp2"
  engine                   = var.engine
  engine_version           = var.engine_version
  instance_class           = var.instance_class
  name = var.db_name
  username                 = var.db_user
  password                 = var.db_password
  parameter_group_name     = "default.${var.engine}${substr(var.engine_version, 0, 3)}"
  skip_final_snapshot      = true
  publicly_accessible      = false
  vpc_security_group_ids   = [var.rds_sg]
  db_subnet_group_name     = aws_db_subnet_group.db-subnetGroup.name
  apply_immediately        = true
  auto_minor_version_upgrade = true
  backup_retention_period  = var.backup_retention_period
  multi_az                 = true
  deletion_protection = false
  storage_encrypted        = true
}