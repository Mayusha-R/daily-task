resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.instance_subnet
  vpc_security_group_ids = [var.instance_sg]
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = var.tag_name
  }
}