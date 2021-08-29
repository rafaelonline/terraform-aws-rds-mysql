 # AWS RDS-MySQL Terraform module

Módulo Terraform para criar instancias de bancos de dados RDS-MySQL na AWS

## Exemplo de utilização

* Consulte o diretório Exemplo.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.33.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.33.0 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.rds_mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.rds_mysql](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_iam_role.rds_enhanced_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.rds_enhanced_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [random_id.snapshot_identifier](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_iam_policy_document.monitoring_rds_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Determines whether or not any DB modifications are applied immediately, or during the maintenance window | `bool` | `false` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The Availability Zone of the RDS instance | `string` | `null` | no |
| <a name="input_backup_retention"></a> [backup\_retention](#input\_backup\_retention) | The days to retain backups for | `string` | `"7"` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. | `string` | `"23:00-00:00"` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | The identifier of the CA certificate for the DB instance | `string` | `"rds-ca-2019"` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | description | `string` | `"true"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name for an automatically created database on cluster creation | `string` | n/a | yes |
| <a name="input_db_instance"></a> [db\_instance](#input\_db\_instance) | The instance type of the RDS instance | `string` | `"db.t3.micro"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | The existing subnet group name to use | `string` | `""` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | The database can't be deleted when this value is set to true. | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to export to cloudwatch | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to use. For supported values, see the Engine parameter in API action https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html | `string` | `"mysql"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version to use. | `string` | `"5.7"` | no |
| <a name="input_final_snapshot_identifier_prefix"></a> [final\_snapshot\_identifier\_prefix](#input\_final\_snapshot\_identifier\_prefix) | The prefix name to use when creating a final snapshot on cluster destroy, appends a random 8 digits to name to ensure it's unique too. | `string` | `"final"` | no |
| <a name="input_identifier_rds"></a> [identifier\_rds](#input\_identifier\_rds) | Name given resources | `string` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | The ARN for the KMS encryption key | `string` | `""` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi. | `string` | `"Sat:01:00-Sat:04:00"` | no |
| <a name="input_major_version"></a> [major\_version](#input\_major\_version) | Indicates that major version upgrades are allowed | `string` | `"false"` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Username for the master DB user | `string` | `"admin"` | no |
| <a name="input_minor_version"></a> [minor\_version](#input\_minor\_version) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. | `string` | `"true"` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. | `string` | `"60"` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Specifies if the RDS instance is multi-AZ | `string` | `"true"` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the DB parameter group to associate or create | `string` | `"default.mysql5.7"` | no |
| <a name="input_password"></a> [password](#input\_password) | Password for the master DB user. | `string` | `""` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the role. | `string` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections. | `string` | `"3306"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Control if instance is publicly accessible | `string` | `"false"` | no |
| <a name="input_security_group"></a> [security\_group](#input\_security\_group) | List of security group IDs to use | `list(string)` | n/a | yes |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created | `string` | `"false"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnet IDs to use | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | n/a | yes |
| <a name="input_volume_encrypted"></a> [volume\_encrypted](#input\_volume\_encrypted) | Specifies whether the DB instance is encrypted | `string` | `"true"` | no |
| <a name="input_volume_max"></a> [volume\_max](#input\_volume\_max) | The upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling | `string` | `"40"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The allocated storage in gibibytes | `string` | `"20"` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD). | `string` | `"gp2"` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate to the cluster in addition to the SG we create in this module | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rds_mysql_db_instance_address"></a> [rds\_mysql\_db\_instance\_address](#output\_rds\_mysql\_db\_instance\_address) | The address of the RDS instance |
| <a name="output_rds_mysql_db_instance_id"></a> [rds\_mysql\_db\_instance\_id](#output\_rds\_mysql\_db\_instance\_id) | The RDS instance ID |
| <a name="output_rds_mysql_db_instance_name"></a> [rds\_mysql\_db\_instance\_name](#output\_rds\_mysql\_db\_instance\_name) | The database name |
| <a name="output_rds_mysql_db_instance_password"></a> [rds\_mysql\_db\_instance\_password](#output\_rds\_mysql\_db\_instance\_password) | The database password |
| <a name="output_rds_mysql_db_instance_port"></a> [rds\_mysql\_db\_instance\_port](#output\_rds\_mysql\_db\_instance\_port) | The database port |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Licença
Este projeto está licenciado sob a licença [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)