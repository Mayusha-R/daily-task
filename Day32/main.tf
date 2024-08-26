provider "aws" {
  region = var.region_name
  profile = var.aws_profile
}

module "vpc" {
  source = "./modules/vpc"
  region_name = var.region_name
  tag_name = var.tag_name
}

module "ec2" {
  source = "./modules/ec2"
  tag_name = var.tag_name
  instance_subnet = module.vpc.instance_subnet
  instance_sg = module.vpc.instance_sg
  ami_id = var.ami_id
}

module "rds" {
  source = "./modules/rds"
  tag_name = var.tag_name
  rds_sg = module.vpc.rds_sg
  rds_subnet_group = module.vpc.rds_subnet_group
}

module "s3bucket" {
  source = "./modules/s3bucket"
  tag_name = var.tag_name
}

module "dynamodb" {
  source = "./modules/dynamodb"
  tag_name = var.tag_name
}