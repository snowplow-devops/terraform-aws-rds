[![Release][release-image]][release] [![CI][ci-image]][ci] [![License][license-image]][license] [![Registry][registry-image]][registry]

# terraform-aws-rds

A Terraform module for deploying a simple RDS instance.

## Usage

```hcl
module "instance" {
  source = "snowplow-devops/rds/aws"

  name        = "test-rds-instance"
  vpc_id      = local.vpc_id
  subnet_ids  = local.subnet_ids
  db_name     = "snowplow"
  db_username = "snowplow"
  db_password = "$N0wPL0W"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ingress_rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [random_string.snapshot_id_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database to create | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | The password of the administration user to create | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The name of the administration user to create | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name which will be pre-pended to the resources created | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The list of subnets to deploy the RDS instance across | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC to deploy the RDS instance within | `string` | n/a | yes |
| <a name="input_additional_ip_allowlist"></a> [additional\_ip\_allowlist](#input\_additional\_ip\_allowlist) | An optional list of CIDR ranges to allow traffic from | `list(any)` | `[]` | no |
| <a name="input_additional_security_group_ids"></a> [additional\_security\_group\_ids](#input\_additional\_security\_group\_ids) | An optional list of security groups to attach to the RDS instance | `list(any)` | `[]` | no |
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The size of the attached disk in GB | `number` | `10` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Whether to automatically upgrade minor versions | `bool` | `true` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The number of days to retain backups | `number` | `7` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Whether to protect the RDS from accidental termination | `bool` | `false` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | A list of log types to enable for exporting to CloudWatch Logs. Valid values for postgres are: postgresql and upgrade. See https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.Concepts.PostgreSQL.html. | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The engine type to use in the RDS instance | `string` | `"postgres"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance type to use | `string` | `"db.t3.micro"` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | The maximum size of the attached disk in GB - if set higher than allocated\_storage will enable auto-scaling | `number` | `0` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. Valid Values: 0, 1, 5, 10, 15, 30, 60. | `number` | `0` | no |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | `string` | `""` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Whether to deploy the RDS across multiple availability zones | `bool` | `false` | no |
| <a name="input_port"></a> [port](#input\_port) | The port to deploy the database on | `number` | `5432` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Whether to make this instance accessible over the internet | `bool` | `false` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | The identifier of a snapshot to restore from | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to append to this resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address"></a> [address](#output\_address) | Address which the RDS instance is bound to |
| <a name="output_id"></a> [id](#output\_id) | ID of the RDS instance |
| <a name="output_port"></a> [port](#output\_port) | Port which the RDS instance exposes (e.g. 5432) |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | ID of the security group attached to the RDS instance |

# Copyright and license

The Terraform AWS RDS project is Copyright 2021-2023 Snowplow Analytics Ltd.

Licensed under the [Apache License, Version 2.0][license] (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[release]: https://github.com/snowplow-devops/terraform-aws-rds/releases/latest
[release-image]: https://img.shields.io/github/v/release/snowplow-devops/terraform-aws-rds

[ci]: https://github.com/snowplow-devops/terraform-aws-rds/actions?query=workflow%3Aci
[ci-image]: https://github.com/snowplow-devops/terraform-aws-rds/workflows/ci/badge.svg

[license]: https://www.apache.org/licenses/LICENSE-2.0
[license-image]: https://img.shields.io/badge/license-Apache--2-blue.svg?style=flat

[registry]: https://registry.terraform.io/modules/snowplow-devops/rds/aws/latest
[registry-image]: https://img.shields.io/static/v1?label=Terraform&message=Registry&color=7B42BC&logo=terraform
