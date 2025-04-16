provider "aws" {
        region = var.region  
}

terraform {
        backend "s3" {
                bucket = "<provide_s3_bucketname>"
                key    = "terraform.tfstate"
                region = "s3_bucket_region"
        }
}