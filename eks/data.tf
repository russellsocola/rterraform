data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    #bucket = "vcc-eks-terraform-state"
    bucket = "dev-miatech-aeromexico-factura"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
