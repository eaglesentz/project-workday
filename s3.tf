resource "aws_s3_bucket" "proj_s3_buckets" {
  count         = length(var.domain_name)
  bucket        = var.domain_name[count.index]
  force_destroy = true
  tags = merge(var.common_tags, {
    Name = "${var.service_name}-s3-bucket"
    }
  )
}

