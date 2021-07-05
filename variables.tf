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

variable "allocated_storage" {
  description = "The size of the attached disk in GB"
  type        = number
  default     = 10
}

variable "max_allocated_storage" {
  description = "The maximum size of the attached disk in GB - if set higher than allocated_storage will enable auto-scaling"
  type        = number
  default     = 10
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

variable "tags" {
  description = "The tags to append to this resource"
  default     = {}
  type        = map(string)
}
