resource "aws_db_instance" "my_db_instance" {
  allocated_storage    = 10
  db_subnet_group_name = var.rds_subnet_group
  vpc_security_group_ids = [var.rds_sg]
  db_name              = var.name_db
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_pass
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  tags = {
    Name = var.tag_name
  }
}