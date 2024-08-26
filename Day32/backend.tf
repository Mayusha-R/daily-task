terraform {
  backend "s3" {
    bucket         = "mayusha-bucket-locks"
    key            = "terraform_state.tfstate"         
    region         = "us-west-1"
    dynamodb_table = "mayusha-locks"
  }
}
