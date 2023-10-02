# RDS instance for the data warehouse
resource "aws_db_instance" "data_warehouse" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "14.7"
  instance_class       = "db.t4g.micro"
  identifier           = var.DB_NAME
  username             = var.USER_NAME
  password             = var.PASSWORD
  parameter_group_name = "default.postgres14"
}

