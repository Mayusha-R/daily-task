terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
        }
    }
}
provider "aws" {
    region = var.region_name
}
resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "${var.tag_name}-VPC"
  }
}
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "${var.tag_name}-subnet"
  }
}
resource "aws_subnet" "my_db_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "${var.tag_name}-subnet"
  }
}
resource "aws_security_group" "security_group" {
    vpc_id = aws_vpc.my_vpc.id
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }    
    tags = {
        Name = "${var.tag_name}-sg"
    }
}
resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.security_group.id]
  }

  tags = {
    Name = "${var.tag_name}-db-sg"
  }
}
resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Name = var.tag_name
  }
}
resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.tag_name}-db-subnetgroup"
  subnet_ids = [aws_subnet.my_subnet.id, aws_subnet.my_db_subnet.id]

  tags = {
    Name = "${var.tag_name}-db-subnetgroup"
  }
}
resource "aws_db_instance" "my_db_instance" {
  allocated_storage    = 10
  db_subnet_group_name = aws_db_subnet_group.db_subnet.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  db_name              = var.name_db
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_pass
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.tag_name}-bucket"
  tags = {
    Name = "${var.tag_name}-bucket"
  }
}

