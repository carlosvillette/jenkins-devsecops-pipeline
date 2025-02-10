provider "aws" {
  region = var.region
}

terraform {

  backend "s3" {
    bucket = "carlosvillette-statefile-terraform-bucket"
    dynamodb_table = "state-lock"
    key = "global/jenkins-devsecops-pipeline/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
