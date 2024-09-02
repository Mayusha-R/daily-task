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

module "aws_infrastructure" {
  source = "./modules/aws_infrastructure"
  tag_name = var.tag_name
  ami_id = var.ami_id
  key_name = "mayusha-task"          
  private_key_path = "/home/einfochips/Day31/mayusha-task.pem"
}