variable "table_name" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "mayusha-locks"
}
variable "tag_name" {
  description = "The custom name to use"
  type        = string
}