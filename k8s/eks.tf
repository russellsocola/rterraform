module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "vcc-eks-tf"
  cluster_version = "1.34"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

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
    node-group = {
      desired_size = 1
      max_size     = 2
      min_size     = 1

      instance_types = ["t3.small"]

      tags = {
        NodeGroup = "node-group"
      }
    }

    tags = {
      Environment = "staging"
      Terraform   = "true"
      repo_url    = "github.com/russellsocola/rterraform"
    }
  }
}
