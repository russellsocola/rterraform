data "aws_caller_identity" "current" {}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "caleidos-test"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_eks_cluster" "cluster" {
	name = module.eks.cluster_name
	depends_on = [ module.eks ]
}

data "aws_eks_cluster_auth" "cluster" {
	name  = module.eks.cluster_name
	depends_on = [ module.eks ]
}