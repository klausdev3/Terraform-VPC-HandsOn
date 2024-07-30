terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }

  backend "s3" {
    bucket = "terraform-backend-s3-klauscloud"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}