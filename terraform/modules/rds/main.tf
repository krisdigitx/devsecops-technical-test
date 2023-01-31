resource "aws_db_instance" "rds" {
  allocated_storage    = var.allocated_storage
  engine               = "mysql"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = "imAUser"
  password             = var.passwordx
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}