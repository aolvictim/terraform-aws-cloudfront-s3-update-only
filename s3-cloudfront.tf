# S3
data "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}

module "template_files" {
  source = "hashicorp/dir/template"
  base_dir = var.files_folder_path
}

resource "aws_s3_object" "object" {
  for_each = module.template_files.files
  bucket   = data.aws_s3_bucket.s3_bucket.id
  key      = "${var.path_prefix}${each.key}"
  content_type = each.value.content_type
  source   = each.value.source_path
  content = each.value.content
  etag = each.value.digests.md5
}

resource "null_resource" "invalidate_cf_cache" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "AWS_PROFILE=${var.aws_profile} aws cloudfront create-invalidation --distribution-id ${var.cf_distribution_id} --paths '/${var.path_prefix}*'"
  }
}
