# provider "aws" {
#   region = local.region
# }

# data "aws_availability_zones" "available" {}

# locals {
#   name   = "ex-eks-mng"
#   region = "us-east-1"

#   vpc_cidr = "10.0.0.0/16"
#   azs      = slice(data.aws_availability_zones.available.names, 0, 3)

#   tags = {
#     Example    = local.name
#     GithubRepo = "terraform-aws-eks"
#     GithubOrg  = "terraform-aws-modules"
#   }
# }

# ################################################################################
# # VPC
# ################################################################################

# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "~> 5.0"

#   name = local.name
#   cidr = local.vpc_cidr

#   azs             = local.azs
#   private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
#   public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
#   intra_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 52)]

#   enable_nat_gateway = true
#   single_nat_gateway = true

#   public_subnet_tags = {
#     "kubernetes.io/role/elb" = 1
#   }

#   private_subnet_tags = {
#     "kubernetes.io/role/internal-elb" = 1
#   }

#   tags = local.tags
# }

# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "~> 20.0"

#   cluster_name    = "my-cluster"
#   cluster_version = "1.30"

#   cluster_endpoint_public_access  = true

#   cluster_addons = {
#     coredns                = {
#         most_recent = true
#     }
#     eks-pod-identity-agent = {
#         most_recent = true
#     }
#     kube-proxy             = {
#         most_recent = true
#     }
#     vpc-cni                = {
#         most_recent  = true
#     }
#   }

#   vpc_id                   = module.vpc.vpc_id
#   subnet_ids               = module.vpc.private_subnets
#   control_plane_subnet_ids = module.vpc.intra_subnets

#   # EKS Managed Node Group(s)
#   eks_managed_node_group_defaults = {
#     instance_types = ["t2.medium"]
#   }

#   eks_managed_node_groups = {
#     example = {
#       # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
#       ami_type       = "AL2023_x86_64_STANDARD"
#       instance_types = ["t2.medium"]

#       min_size     = 2
#       max_size     = 5
#       desired_size = 2
#     }
#   }

#   # Cluster access entry
#   # To add the current caller identity as an administrator
#   enable_cluster_creator_admin_permissions = true

# #   access_entries = {
# #     # One access entry with a policy associated
# #     example = {
# #       kubernetes_groups = []
# #       principal_arn     = "arn:aws:iam::123456789012:role/something"

# #       policy_associations = {
# #         example = {
# #           policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
# #           access_scope = {
# #             namespaces = ["default"]
# #             type       = "namespace"
# #           }
# #         }
# #       }
# #     }
# #   }

#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }





