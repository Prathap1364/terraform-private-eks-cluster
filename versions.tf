# Terraform Block
terraform {
  required_version = "~>1.1.7" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket = "prathap1364567890"
    key    = "statefile-storage/terraform.tfstate"
    region = "us-east-1"

  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}