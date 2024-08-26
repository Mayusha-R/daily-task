variable "ami_id" {
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
variable "instance_subnet" {
  description = "The instance subnet"
  type        = string
}

variable "instance_sg" {
  description = "The instance security group"
  type        = string
}
