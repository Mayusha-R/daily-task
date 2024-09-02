resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  tags = {
    Name = var.tag_name
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
    command = "echo 'EC2 instance successfully provisioned with Apache2' "
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    Name = "${var.tag_name}-bucket"
  }
}