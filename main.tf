locals {
  local_tags = {
    Name = var.name
  }

  tags = merge(
    var.tags,
    local.local_tags
  )
}

resource "aws_security_group" "sg" {
  name   = var.name
  vpc_id = var.vpc_id
  tags   = local.tags
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = var.name
  subnet_ids = var.subnet_ids
  tags       = local.tags
}

resource "random_string" "snapshot_id_suffix" {
  length  = 8
  special = false
}

resource "aws_db_instance" "instance" {
  identifier_prefix = "${var.name}-"

  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  backup_retention_period    = var.backup_retention_period

  db_subnet_group_name = aws_db_subnet_group.subnet_group.name

  engine = var.engine

  parameter_group_name = var.parameter_group_name

  instance_class = var.instance_class
  multi_az       = var.multi_az

  db_name  = var.db_name
  password = var.db_password
  port     = var.port
  username = var.db_username

  storage_type          = var.storage_type
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_encrypted     = true

  snapshot_identifier       = var.snapshot_identifier
  final_snapshot_identifier = "${var.name}-${random_string.snapshot_id_suffix.result}"
  copy_tags_to_snapshot     = true

  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = compact(concat([aws_security_group.sg.id], var.additional_security_group_ids))
  ca_cert_identifier     = var.ca_cert_identifier

  deletion_protection = var.deletion_protection
  apply_immediately   = true

  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = var.monitoring_role_arn

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  tags = local.tags
}

resource "aws_security_group_rule" "ingress_rds" {
  count = length(var.additional_ip_allowlist) > 0 ? 1 : 0

  type              = "ingress"
  from_port         = aws_db_instance.instance.port
  to_port           = aws_db_instance.instance.port
  protocol          = "tcp"
  cidr_blocks       = compact(var.additional_ip_allowlist)
  security_group_id = aws_security_group.sg.id
}
