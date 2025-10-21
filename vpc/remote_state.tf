terraform {
  backend "s3" {
    bucket = "rsocola-vcc-eks-terraform-state"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
