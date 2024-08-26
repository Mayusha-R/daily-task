variable "tag_name" {
  description = "The custom name to use"
  type        = string
}
variable "region_name" {
  description = "The AWS region used"
  type        = string
}
variable "aws_profile" {
  description = "The profile to use"
  type        = string
}
variable "ami_id" {
  description = "AMI ID used to create instance"
  type        = string
}
