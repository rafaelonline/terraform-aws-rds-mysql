module "rds" {
  source         = "./modules/rds"
  subnets        = ["subnet-6a482535", "subnet-9d0b6bfb"]
  security_group = ["sg-40ab664e"]

  identifier_rds      = "mydatabase"
  database_name       = "base"
  engine              = "mysql"
  engine_version      = "5.7.31"
  master_username     = "user"
  port                = "3306"
  db_instance         = "db.t3.micro"
  volume_size         = "10"
  volume_type         = "gp2"
  multi_az            = true
  deletion_protection = false

  enabled_cloudwatch_logs_exports = ["error", "slowquery", "audit"]

  ### TAGS ###
  tags = {
    owner       = "labs"
    environment = "dev"
  }
}