terraform {
  backend "s3" {
    bucket         = "workdayproj-tfstate"
    key            = "workdayproj.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "workday-terraform-lock-state"
    encrypt        = true
  }
}