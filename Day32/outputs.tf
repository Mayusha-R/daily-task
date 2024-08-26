output "instance_private_ip" {
  value = module.ec2.instance_ip_addr
}

output "vpc_id" {
  value = module.vpc.id_vpc
}

output "rds_db_name" {
  value = module.rds.db_name
}

#output "bucket_domain_name" {
#  value = module.s3bucket.bucket_name
#}

output "table_name" {
  value = module.dynamodb.table_name
}
