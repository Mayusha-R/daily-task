output "id_vpc" {
  value = aws_vpc.my_vpc.id
}

output "instance_subnet" {
  value = aws_subnet.my_subnet.id
}

output "instance_sg" {
  value = aws_security_group.security_group.id
}

output "rds_subnet_group"{
  value = aws_db_subnet_group.db_subnet.id
}

output "rds_sg" {
  value = aws_security_group.db_sg.id
}