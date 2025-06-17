terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket       = "terraform-s3-bucket-123"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}

# Configure the AWS Providers
provider "aws" {
  region = var.region
}