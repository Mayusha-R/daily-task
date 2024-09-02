provider "aws" {
  region = var.region_name
}

module "s3bucket" {
  source = "./modules/s3bucket"
  region_name = var.region_name
  tag_name = var.tag_name
}

module "dynamodb" {
  source = "./modules/dynamodb"
  region_name = var.region_name
  tag_name = var.tag_name
}