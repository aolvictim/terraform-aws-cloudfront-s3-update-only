variable "aws_region" {
  description = "AWS Region to deploy to"
}

variable "aws_profile" {
  default     = "default"
  description = "AWS_PROFILE variable to set"
}

variable "bucket_name" {
  description = "Bucket name"
}

variable "files_folder_path" {
  description = "Path to files to be uploaded"
}

variable "path_prefix" {
  description = "Prefix to path to files to be uploaded"
  default = ""
}

variable "cf_distribution_id" {
  description = "Cloudfront Distribution ID"
}

