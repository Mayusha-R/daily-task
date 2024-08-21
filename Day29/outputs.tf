output "instance_ip_addr" {
  value       = aws_instance.my_instance.private_ip
  description = "The Public IP address of the main server instance."
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.my_db_instance.port
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.my_db_instance.username
}