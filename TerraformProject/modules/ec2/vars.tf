variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {}
variable "associate_public_ip_address" {}
variable "vpc_security_group_ids" {}
variable "countinstance" {
  type = number
}
variable "subnet" {
  type = string
}
variable "environment" {
  type = string
}
