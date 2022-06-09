resource "aws_s3_bucket" "artifact_s3_buckets" {
  bucket        = "artifactpipeline-buckets"
  force_destroy = true
  tags = merge(var.common_tags, {
    Name = "${var.service_name}-artifact-bucket"
    }
  )
}

resource "aws_s3_bucket_acl" "codepipeline_bucket_acl" {
  bucket = aws_s3_bucket.artifact_s3_buckets.id
  acl    = "private"
}