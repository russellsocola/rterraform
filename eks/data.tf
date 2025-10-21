data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "rsocola-vcc-eks-terraform-state"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
