variable "vpc_id" {
  description = "The VPC to deploy the RDS instance within"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnets to deploy the RDS instance across"
  type        = list(string)
}

module "postgres" {
  source = "../../"

  name        = "postgres-instance"
  vpc_id      = var.vpc_id
  subnet_ids  = var.subnet_ids
  db_name     = "snowplow"
  db_username = "snowplow"
  db_password = "$N0wPL0W"
}

output "id" {
  value = module.postgres.id
}

output "address" {
  value = module.postgres.address
}

output "port" {
  value = module.postgres.port
}
