module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  cidr = var.cidr_block

  azs                   = var.avaibility_zone
  private_subnets       = var.private_subnets
  public_subnets        = var.public_subnets
  private_subnet_suffix = "test"
  enable_nat_gateway    = true
  name                  = "app"

  tags = {
    Environment = "dev"
  }
}

#EKS cluster

data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}

module "my-cluster" {
  depends_on = [
    module.vpc
  ]
  source                          = "terraform-aws-modules/eks/aws"
  cluster_name                    = "testing"
  cluster_version                 = "1.17"
  subnets                         = module.vpc.private_subnets
  vpc_id                          = module.vpc.vpc_id
  cluster_create_timeout          = "1h"
  cluster_endpoint_private_access = true

  fargate_profiles = {
    example = {
      namespace = "default"

      # Kubernetes labels for selection
      # labels = {
      #   Environment = "test"
      #   GithubRepo  = "terraform-aws-eks"
      #   GithubOrg   = "terraform-aws-modules"
      # }

      # using specific subnets instead of all the ones configured in eks
      # subnets = ["subnet-0ca3e3d1234a56c78"]

      tags = {
        Owner = "test"
      }
    }
  }

#   worker_groups = [
#     {
#       instance_type         = var.instance_type
#       asg_desrired_capacity = 2
      
#     }
#   ]
}


