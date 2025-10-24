terraform {
  backend "s3" {
    bucket = "caleidos-test"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
