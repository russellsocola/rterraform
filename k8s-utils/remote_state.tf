terraform {
  backend "s3" {
    # bucket = "vcc-eks-terraform-state"
    bucket = "dev-miatech-aeromexico-factura"
    key = "k8s-utils/terraform.tfstate"
    region = "us-east-1"
  }
}