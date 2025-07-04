provider "aws" {
    region = "us-east-1"
}

module "keypair" {
    source = "../modules/keypair"
    the_key_name = "devkeytest.pem"
    filename = "devkeytest.pem"
} 

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "devapp1"
  cidr = "10.0.0.0/16"

  azs             = ["eu-east-1a", "eu-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}