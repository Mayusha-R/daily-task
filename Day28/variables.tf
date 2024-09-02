variable "region_name" {
  description = "The region to be used while creating resources."
  type        = string
  default     = "us-east-2"
}

variable "tag_name" {
  description = "Tags name to set for resources."
  type        = string
  default     = "mayusha"
}
variable "instance_type" {
  description = "Instance type to be used while creating instance."
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to be used while creating the instance."
  type        = string
  default     = "ami-000a81e3bab21747d"
}
variable "name_db" {
  description = "Name of database"
  type        = string
  default     = "Mayushadb"
}
variable "db_user" {
  description = "Name of database user"
  type        = string
  default     = "user"
}

variable "db_pass" {
  description = "Password for the user"
  type        = string
  default     = "password"
}