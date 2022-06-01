terraform {
  backend "s3" {
    bucket         = "projdev-tfstate"
    key            = "projdev.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "proj-terraform-lock-state"
  }
}