variable "database_name" {
  description = "Name given database"
  type        = string
}

variable "identifier_rds" {
  description = "Name given resources"
  type        = string
}

variable "security_group" {
  type        = list(string)
  description = "description"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate to the cluster in addition to the SG we create in this module"
  type        = list(string)
  default     = []
}


variable "subnets" {
  description = "List of subnet IDs to use"
  type        = list(string)
}

variable "db_subnet_group_name" {
  description = "The existing subnet group name to use"
  type        = string
  default     = ""
}

variable "db_instance" {
  default = "db.t3.micro"
}

variable "volume_type" {
  default = "gp2"
}
variable "volume_size" {
  default = "20"
}
variable volume_encrypted {
  type        = string
  default     = "true"
  description = "Specifies whether the DB instance is encrypted"
}

variable engine {
  type        = string
  description = "description"
}
variable engine_version {
  type        = string
  description = "description"
}
variable master_username {
  type        = string
  default     = "admin"
  description = "description"
}
variable password {
  type        = string
  default     = ""
  description = "description"
}
variable parameter_group_name {
  type        = string
  default     = "default.mysql5.7"
  description = "Name of the DB parameter group to associate or create"
}
variable major_version {
  type        = string
  default     = "false"
  description = "description"
}
variable minor_version {
  type        = string
  default     = "true"
  description = "description"
}
variable backup_retention {
  type        = string
  default     = "7"
  description = "The days to retain backups for"
}
variable backup_window {
  type        = string
  default     = "23:00-00:00"
  description = "description"
}
variable maintenance_window {
  type        = string
  default     = "Sat:01:00-Sat:04:00"
  description = "description"
}
variable multi_az {
  type        = string
  default     = "true"
  description = "description"
}
variable skip_final_snapshot {
  type        = string
  default     = "false"
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created"
}



variable "final_snapshot_identifier_prefix" {
  description = "The prefix name to use when creating a final snapshot on cluster destroy, appends a random 8 digits to name to ensure it's unique too."
  type        = string
  default     = "final"
}

variable port {
  type        = string
  default     = "3306"
  description = "description"
}
variable monitoring_interval {
  type        = string
  default     = "60"
  description = "description"
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}


variable kms_key {
  type        = string
  description = "description"
  default     = ""
}
variable "db_parameter_group_name" {
  description = "The name of a DB parameter group to use"
  type        = string
  default     = null
}
variable availability_zone {
  type        = string
  default     = null
  description = "The Availability Zone of the RDS instance"
}
variable publicly_accessible {
  type        = string
  default     = "false"
  description = "Control if instance is publicly accessible"
}
variable copy_tags_to_snapshot {
  type        = string
  default     = "true"
  description = "description"
}
variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type        = bool
  default     = true
}

variable "ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance"
  type        = string
  default     = "rds-ca-2019"
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to cloudwatch"
  type        = list(string)
  default     = []
}

variable "apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window"
  type        = bool
  default     = false
}

### TAGS ###
variable "environment" {
  type = string
}

variable "owner" {
  description = ""
  type        = string
}


variable build {
  type        = string
  default     = "Terraform"
  description = ""
}
