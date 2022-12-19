# terraform-cloudfront-s3

This module uploads files to S3 bucket and create CF invalidations.

## Prerequisites
- S3 Bucket
- Cloudfront Distribution


## Example Usage
```hcl
terraform {
  backend "http" {
  }
}

provider "aws" {
  region  = "us-west-2"
  profile = "YOUR-AWS-PROFILE-NAME"
  # Or you can use ACCESS KEY and CREDENTIAL
}

module "cloudfront_s3_cdn" {
  source             = "aolvictim/cloudfront-s3/aws" 
  aws_region         = "us-west-2"
  bucket_name        = "MY-APP-BUCKET"
  files_folder_path  = "../../dist" # Path to the dist folder
  path_prefix        = "sub-folder/xyz/"
  cf_distribution_id = "E2NXXXXMC9L90" 
}

```