terraform {
  backend "s3" {
    bucket = "rsocola-vcc-eks-terraform-state"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
