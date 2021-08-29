variable "database_name" {
  description = "Name for an automatically created database on cluster creation"
  type        = string
}

variable "identifier_rds" {
  description = "Name given resources"
  type        = string
}

variable "security_group" {
  type        = list(string)
  description = "List of security group IDs to use"
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
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "volume_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)."
  type        = string
  default     = "gp2"
}

variable "volume_size" {
  description = "The allocated storage in gibibytes"
  type        = string
  default     = "20"
}

variable volume_max {
  type        = string
  default     = "40"
  description = "The upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling"
}

variable volume_encrypted {
  type        = string
  default     = "true"
  description = "Specifies whether the DB instance is encrypted"
}

variable engine {
  type        = string
  default     = "mysql"
  description = "The database engine to use. For supported values, see the Engine parameter in API action https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html"
}

variable engine_version {
  type        = string
  default     = "5.7"
  description = "The engine version to use."
}

variable master_username {
  type        = string
  default     = "admin"
  description = "Username for the master DB user"
}

variable password {
  type        = string
  default     = ""
  description = "Password for the master DB user."
}

variable parameter_group_name {
  type        = string
  default     = "default.mysql5.7"
  description = "Name of the DB parameter group to associate or create"
}

variable major_version {
  type        = string
  default     = "false"
  description = "Indicates that major version upgrades are allowed"
}

variable minor_version {
  type        = string
  default     = "true"
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
}

variable backup_retention {
  type        = string
  default     = "7"
  description = "The days to retain backups for"
}

variable backup_window {
  type        = string
  default     = "23:00-00:00"
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
}

variable maintenance_window {
  type        = string
  default     = "Sat:01:00-Sat:04:00"
  description = "The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:mi."
}

variable multi_az {
  type        = string
  default     = "true"
  description = "Specifies if the RDS instance is multi-AZ"
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
  description = "The port on which the DB accepts connections."
}
variable monitoring_interval {
  type        = string
  default     = "60"
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance."
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type        = string
  default     = null
}

variable kms_key {
  type        = string
  description = "The ARN for the KMS encryption key"
  default     = ""
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

variable tags {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
}
