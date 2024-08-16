module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.0.0"  # Specify the correct version here
  cluster_name    = "socks-shop-cluster"
  cluster_version = "1.21"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t3.medium"
    }
  }
}
