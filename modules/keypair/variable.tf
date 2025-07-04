variable "key_algorithm" {
  description = "this is the key algorithm"
  default = "RSA"
}
variable "key_rsa_bits" {
  description = "this is the key size"
  default = 2048
}
variable "the_key_name" {}

variable "filename" {}

variable "file_permission" {
    default = 400
}
variable "region" {
  default = "us-east-1"
}