data "terraform_remote_state" "vpc"{
    backend = "s3"

    config = {
        bucket = "rsocola-vcc-eks-terraform-state"
        key = "vpc/terraform.tfstate"
        region = "us-east-1"
    }
}

data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "rsocola-vcc-eks-terraform-state"
    key = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}