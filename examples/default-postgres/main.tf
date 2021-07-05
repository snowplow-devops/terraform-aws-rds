locals {
  vpc_id     = "vpc-xxx"
  subnet_ids = ["subnet-xxx"]
}

module "instance" {
  source = "../../"

  name        = "test-rds-instance"
  vpc_id      = local.vpc_id
  subnet_ids  = local.subnet_ids
  db_name     = "snowplow"
  db_username = "snowplow"
  db_password = "$N0wPL0W"
}

output "id" {
  value = module.instance.id
}
