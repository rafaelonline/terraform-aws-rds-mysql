output "rds_mysql_db_instance_address" {
  description = "The address of the RDS instance"
  value       = element(concat(aws_db_instance.rds_mysql.*.address, [""]), 0)
}

output "rds_mysql_db_instance_port" {
  description = "The database port"
  value       = element(concat(aws_db_instance.rds_mysql.*.port, [""]), 0)
}

output "rds_mysql_db_instance_id" {
  description = "The RDS instance ID"
  value       = element(concat(aws_db_instance.rds_mysql.*.id, [""]), 0)
}

output "rds_mysql_db_instance_name" {
  description = "The database name"
  value       = element(concat(aws_db_instance.rds_mysql.*.name, [""]), 0)
}

output "rds_mysql_db_instance_password" {
  description = "The database password"
  value       = element(concat(aws_db_instance.rds_mysql.*.password, [""]), 0)
  sensitive   = false
}