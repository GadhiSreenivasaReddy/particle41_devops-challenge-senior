provider "aws" {
        region = var.region  
}

terraform {
        backend "s3" {
                bucket = "gadhi-us-east-1"
                key    = "terraform.tfstate"
                region = "us-east-1"
        }
}