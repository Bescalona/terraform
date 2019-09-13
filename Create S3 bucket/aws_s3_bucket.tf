resource "aws_s3_bucket" "b"{
  count         = "${length(var.s3_bucket_name)}"
  bucket        = "${var.s3_bucket_name[count.index]}"
  acl    = "private"
  region = "us-east-2"

  tags = {
    Name        = "${var.s3_bucket_name[count.index]}"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.aws_kms_key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}