resource "aws_db_instance" "rds_mysql" {
  name              = var.database_name
  engine            = var.engine
  engine_version    = var.engine_version
  identifier        = var.identifier_rds
  username          = var.master_username
  password          = join("", random_password.password.*.result)
  instance_class    = var.db_instance
  allocated_storage = var.volume_size
  storage_type      = var.volume_type
  multi_az          = var.multi_az
  #db_subnet_group_name       = var.subnet_group
  db_subnet_group_name = join("", aws_db_subnet_group.rds_mysql.*.name)
  #vpc_security_group_ids     = [var.security_group]
  vpc_security_group_ids     = compact(concat(var.security_group, var.vpc_security_group_ids))
  availability_zone          = var.availability_zone
  port                       = var.port
  publicly_accessible        = var.publicly_accessible
  parameter_group_name       = var.parameter_group_name
  backup_retention_period    = var.backup_retention
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window
  storage_encrypted          = var.volume_encrypted
  kms_key_id                 = var.kms_key
  auto_minor_version_upgrade = var.minor_version
  skip_final_snapshot        = var.skip_final_snapshot
  final_snapshot_identifier  = "${var.final_snapshot_identifier_prefix}-${var.identifier_rds}-${random_id.snapshot_identifier.hex}"
  copy_tags_to_snapshot      = var.copy_tags_to_snapshot
  deletion_protection        = var.deletion_protection
  ca_cert_identifier         = var.ca_cert_identifier
  apply_immediately          = var.apply_immediately

  monitoring_role_arn             = join("", aws_iam_role.rds_enhanced_monitoring.*.arn)
  monitoring_interval             = var.monitoring_interval
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  tags = {
    Environment = var.environment
    Owner       = var.owner
    Build_from  = var.build
  }
}

resource "aws_db_subnet_group" "rds_mysql" {
  count = var.db_subnet_group_name == "" ? 1 : 0

  name        = var.identifier_rds
  description = "For RDS instance ${var.identifier_rds}"
  subnet_ids  = var.subnets
}

resource "random_id" "snapshot_identifier" {
  keepers = {
    id = var.identifier_rds
  }

  byte_length = 4
}

resource "random_password" "password" {
  count            = var.password == "" ? 1 : 0
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_iam_role" "rds_enhanced_monitoring" {
  count = var.monitoring_interval > 0 ? 1 : 0

  name               = "rds-enhanced-monitoring-${var.identifier_rds}"
  assume_role_policy = data.aws_iam_policy_document.monitoring_rds_assume_role.json

  permissions_boundary = var.permissions_boundary
}

resource "aws_iam_role_policy_attachment" "rds_enhanced_monitoring" {
  count = var.monitoring_interval > 0 ? 1 : 0

  role       = join("", aws_iam_role.rds_enhanced_monitoring.*.name)
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}