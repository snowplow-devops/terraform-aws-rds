variable "name" {
  description = "A name which will be pre-pended to the resources created"
  type        = string
}

variable "vpc_id" {
  description = "The VPC to deploy the RDS instance within"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnets to deploy the RDS instance across"
  type        = list(string)
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "db_username" {
  description = "The name of the administration user to create"
  type        = string
}

variable "db_password" {
  description = "The password of the administration user to create"
  type        = string
  sensitive   = true
}

variable "engine" {
  description = "The engine type to use in the RDS instance"
  type        = string
  default     = "postgres"
}

variable "port" {
  description = "The port to deploy the database on"
  type        = number
  default     = 5432
}

variable "instance_class" {
  description = "The instance type to use"
  type        = string
  default     = "db.t3.micro"
}

variable "publicly_accessible" {
  description = "Whether to make this instance accessible over the internet"
  type        = bool
  default     = false
}

variable "ca_cert_identifier" {
  description = "Identifier of the CA certificate for the DB instance. Example: `rds-ca-2019`, `rds-ca-rsa2048-g1`, `rds-ca-ecc384-g1`, or `rds-ca-rsa4096-g1`."
  type        = string
  default     = "rds-ca-2019"
}

variable "allocated_storage" {
  description = "The size of the attached disk in GB"
  type        = number
  default     = 10
}

variable "max_allocated_storage" {
  description = "The maximum size of the attached disk in GB - if set higher than allocated_storage will enable auto-scaling"
  type        = number
  default     = 0
}

variable "deletion_protection" {
  description = "Whether to protect the RDS from accidental termination"
  type        = bool
  default     = false
}

variable "snapshot_identifier" {
  description = "The identifier of a snapshot to restore from"
  type        = string
  default     = ""
}

variable "auto_minor_version_upgrade" {
  description = "Whether to automatically upgrade minor versions"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "The number of days to retain backups"
  type        = number
  default     = 7
}

variable "multi_az" {
  description = "Whether to deploy the RDS across multiple availability zones"
  type        = bool
  default     = false
}

variable "additional_ip_allowlist" {
  description = "An optional list of CIDR ranges to allow traffic from"
  type        = list(any)
  default     = []
}

variable "additional_security_group_ids" {
  description = "An optional list of security groups to attach to the RDS instance"
  type        = list(any)
  default     = []
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  type        = string
  default     = ""
}

variable "tags" {
  description = "The tags to append to this resource"
  default     = {}
  type        = map(string)
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = 0
  type        = number
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
  default     = ""
  type        = string
}

variable "enabled_cloudwatch_logs_exports" {
  description = "A list of log types to enable for exporting to CloudWatch Logs. Valid values for postgres are: postgresql and upgrade. See https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.Concepts.PostgreSQL.html."
  default     = []
  type        = list(string)
}

variable "storage_type" {
  description = "The type of storage to use"
  type        = string
  default     = "gp2"
}
