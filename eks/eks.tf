module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name = "vcc-eks-tf"
  cluster_version = "1.34"

  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true #false para prod

  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {
      resolve_conflicts = "OVERWRITE"
    }
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }
  
  eks_managed_node_groups = {
    group1 = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.small"]
      capacity_type = "ON_DEMAND"

      tags = {
        NodeGroup = "group1"
      }
    }
  }
  tags = {
    Environment = "staging"
    Terraform   = "true"
    repo_url    = "github.com/russellsocola/rterraform"
  }
}
