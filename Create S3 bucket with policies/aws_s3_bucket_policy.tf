resource "aws_s3_bucket_policy" "b" {
  count         = "${length(var.s3_bucket_name)}"
  bucket = "${aws_s3_bucket.b[count.index].id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "PutObjPolicy",
    "Statement": [
        {
            "Sid": "DenyPutObjectWithIncorrectEncryptionHeader",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.b[count.index].arn}/*",
            "Condition": {
                "StringNotLike": {
                    "s3:x-amz-server-side-encryption-aws-kms-key-id": "${var.kms_arn}"
                }
            }
        }
    ]
}
POLICY
}