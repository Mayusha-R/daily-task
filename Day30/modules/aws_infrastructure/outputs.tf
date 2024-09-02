output "instance_ip_addr" {
  value       = aws_instance.my_instance.public_ip
  description = "The Public IP address of the main server instance."
}
output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}