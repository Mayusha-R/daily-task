variable "tag_name" {
  description = "The custom name to use"
  type        = string
}

variable "db_user" {
  description = "The user name"
  type        = string
  default     = "user123"
}

variable "db_pass" {
  description = "The password for that user"
  type        = string
  default     = "password123"
}

variable "name_db" {
  description = "The db name to create"
  type        = string
  default     = "mayushadb"
}

variable "rds_subnet_group"{
  description = "The db subnet group"
  type        = string
}

variable "rds_sg" {
  description = "The db security group"
  type        = string
}