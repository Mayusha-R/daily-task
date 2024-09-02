variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "mayusha-bucket-locks"
}
variable "tag_name" {
  description = "The custom name to use"
  type        = string
}
variable "region_name" {
  description = "The AWS region used"
  type        = string
}
