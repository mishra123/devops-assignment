data aws_region current {}

resource "aws_s3_bucket" "default" {
  bucket        = "${var.name}"
  acl           = try(length(var.grants), 0) == 0 ? var.acl : null
  force_destroy = var.force_destroy
  policy        = var.policy
  tags          = var.tags

  versioning {
    enabled = var.versioning_enabled
  }

  lifecycle_rule {
    id                                     = var.name
    enabled                                = var.lifecycle_rule_enabled
    prefix                                 = var.prefix
    tags                                   = var.lifecycle_tags
    abort_incomplete_multipart_upload_days = var.abort_incomplete_multipart_upload_days

    noncurrent_version_expiration {
      days = var.noncurrent_version_expiration_days
    }

    dynamic "noncurrent_version_transition" {
      for_each = var.enable_glacier_transition ? [1] : []

      content {
        days          = var.noncurrent_version_transition_days
        storage_class = "GLACIER"
      }
    }

    dynamic "transition" {
      for_each = var.enable_glacier_transition ? [1] : []

      content {
        days          = var.glacier_transition_days
        storage_class = "GLACIER"
      }
    }

    dynamic "transition" {
      for_each = var.enable_standard_ia_transition ? [1] : []

      content {
        days          = var.standard_transition_days
        storage_class = "STANDARD_IA"
      }
    }

    expiration {
      days = var.expiration_days
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_master_key_arn
      }
    }
  }

  dynamic "cors_rule" {
    for_each = var.cors_rule_inputs == null ? [] : var.cors_rule_inputs

    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }

  dynamic "grant" {
    for_each = try(length(var.grants), 0) == 0 || try(length(var.acl), 0) > 0 ? [] : var.grants

    content {
      id          = grant.value.id
      type        = grant.value.type
      permissions = grant.value.permissions
      uri         = grant.value.uri
    }
  }
}

resource "aws_s3_bucket_public_access_block" "default" {
  count = length("${aws_s3_bucket.default.*.id}")
  bucket = aws_s3_bucket.default.*.id[count.index]
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
