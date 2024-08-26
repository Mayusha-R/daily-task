resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.tag_name}-vpc"
  }
}
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region_name}b"
  tags = {
    Name = "${var.tag_name}-subnet"
  }
}
resource "aws_subnet" "my_db_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region_name}a"
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

resource "aws_db_subnet_group" "db_subnet" {
  name       = "mayusha-db-subnetgroup"
  subnet_ids = [aws_subnet.my_subnet.id, aws_subnet.my_db_subnet.id]

  tags = {
    Name = "${var.tag_name}-db-subnetgroup"
  }
}