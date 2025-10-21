terraform {
  backend "s3" {
    bucket = "rsocola-vcc-eks-terraform-state"
    key = "k8s-resources/terraform.tfstate"
    region = "us-east-1"
  }
}