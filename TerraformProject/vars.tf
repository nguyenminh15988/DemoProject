variable "environment" {
  description = "The Deployment environment"
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "The CIDR block for the private subnet"
}

variable "region" {
  description = "The region to launch the bastion host"
}

variable "availability_zones" {
  type        = list(any)
  description = "The az that the resources will be launched"
}

// EC2 instance variable 
variable "countinstance" {
  type = number
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "associate_public_ip_address" {
  type = string
}
variable "key_name" {
  type = string
}