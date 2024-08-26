resource "aws_dynamodb_table" "terraformlock" {
  name         = var.table_name
  hash_key     = "LockID"
  read_capacity   = 1
  write_capacity  = 1

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "${var.tag_name}-lockdb"
  }
}