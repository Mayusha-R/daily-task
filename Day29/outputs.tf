output "bucket_domain_name" {
  value = module.s3bucket.bucket_name
}

output "table_name" {
  value = module.dynamodb.table_name
}
