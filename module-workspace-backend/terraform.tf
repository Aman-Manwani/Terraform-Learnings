
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
  backend "s3" {
    bucket = "aman-terraform-state-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}