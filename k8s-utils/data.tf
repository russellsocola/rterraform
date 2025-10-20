data "terraform_remote_state" "vpc"{
    backend = "s3"

    config = {
        # bucket = "vcc-eks-terraform-state"
        bucket = "dev-miatech-aeromexico-factura"
        key = "vpc/terraform.tfstate"
        region = "us-east-1"
    }
}

data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    # bucket = "vcc-eks-terraform-state"
    bucket = "dev-miatech-aeromexico-factura"
    key = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}