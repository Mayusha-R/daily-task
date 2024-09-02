variable "ami_id" {
  description = "AMI ID used to create instance"
  type        = string
}
variable "key_name" {
  description = "AMI ID used to create instance"
  type        = string
}
variable "private_key_path" {
  description = "AMI ID used to create instance"
  type        = string
}
variable "instance_type" {
  description = "Type of instance to use"
  type        = string
  default     = "t2.micro"
}
variable "tag_name" {
  description = "The custom name to use"
  type        = string
}
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "mayusha-bucket"
}