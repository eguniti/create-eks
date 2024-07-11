terraform {
  backend "s3" {
    bucket = "assess-demo-nitin-1"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}
