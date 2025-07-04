provider "aws" {
    region = "us-east-1"
}

module "aws_key_pair" {
    source = "../modules/keypair"
    the_key_name = "qakeytest"
    filename = "qakeytest.pem"
}