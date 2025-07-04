terraform {
  backend "s3" {
    bucket         = "week6-od-bucket-terraform"
    key            = "terrarevision/terraform.tfstate"
    dynamodb_table = "statefile-lock"
    region         = "us-east-1"
    encrypt        = true
  }
}