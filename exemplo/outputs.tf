output "rds_mysql_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.rds.rds_mysql_db_instance_address
}

output "rds_mysql_db_instance_port" {
  description = "The database port"
  value       = module.rds.rds_mysql_db_instance_port
}

output "rds_mysql_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.rds.rds_mysql_db_instance_id
}

output "rds_mysql_db_instance_name" {
  description = "The database name"
  value       = module.rds.rds_mysql_db_instance_name
}

output "rds_mysql_db_instance_password" {
  description = "The database password"
  value       = module.rds.rds_mysql_db_instance_password
  sensitive   = false
}