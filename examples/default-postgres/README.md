## Default Postgres

By default the module creates a micro Postgres Instance in a single-az.  To add allowlist access to the database you need to leverage the returned `sg_id` and decorate it with the inbound / outbound ports, IP ranges and source/dest security groups for firewall control.

```hcl
module "instance" {
  source = "snowplow-devops/rds/aws"

  name        = "test-rds-instance"
  vpc_id      = var.vpc_id
  subnet_ids  = var.subnet_ids
  db_name     = "snowplow"
  db_username = "snowplow"
  db_password = "$N0wPL0W"
}
```
