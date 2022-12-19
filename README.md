# terraform-cloudfront-s3

We deploy a lot of Single Page Applications (mainly Ember.js) written in Javascript. This module makes it easier to deploy changes to Cloudfront + S3.

## Prerequisites
- Domain name is in Route 53
- ACM certificate requested and verified (You can use wildcard certs)

## Notes
- Default to redirect 403 and 404 errors to `index.html`
- It will also create invalidation when files changed in S3

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
  source            = "aolvictim/cloudfront-s3/aws" 
  aws_region        = "us-west-2"
  bucket_name       = "MY-APP-BUCKET"
  files_folder_path = "../../dist" # Path to the dist folder
  host_name         = "app" 
  domain_name       = "xyz.com"
  acm_cert_arn      = "arn:aws:acm:us-east-1:XXXXXXX:certificate/XXXXXXX"
}

```