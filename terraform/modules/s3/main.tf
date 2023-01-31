resource "aws_s3_bucket" "website_bucket" {
  bucket = "delio-hoodies-website"

  tags = {
    Name        = "Delio Hoodies Website"
    Environment = "Prod"
    Region      = "Ireland"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.website_bucket.id
  acl    = "public"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

# Removing because I couldn't get it to work
#resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
#  bucket = aws_s3_bucket.mybucket.bucket

# rule {
#    apply_server_side_encryption_by_default {
#      kms_master_key_id = aws_kms_key.mykey.arn
#      sse_algorithm     = "aws:kms"
#    }
#  }