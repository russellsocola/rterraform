module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vcc-eks-tf"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "staging"
    repo_url    = "github.com/russellsocola/rterraform"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/vcc-eks-tf" = "shared"
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"  = "1"
    "kubernetes.io/cluster/vcc-eks-tf" = "shared"
  }
}
