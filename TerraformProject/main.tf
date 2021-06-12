
/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["${var.region}a", "${var.region}b", "${var.region}c"]
}

module "networking" {
  source = "./modules/networking"

  #region               = var.region
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = local.production_availability_zones
}

module "ec2-instance" {
  depends_on = [
    module.networking
  ]
  source                      = "./modules/ec2"
  countinstance               = var.countinstance
  ami_id                      = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = module.networking.security_groups_ids
  subnet                      = module.networking.public_subnets_id[0]
  key_name                    = var.key_name
  environment                 = var.environment
}