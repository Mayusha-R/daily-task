terraform {
  backend "s3" {
    bucket         = "mayusha-bucket-locks"
    key            = "terraform_state.tfstate"         
    region         = "us-east-2"                   
    dynamodb_table = "mayusha-locks"
  }
}
