resource "aws_kms_key" "aws_kms_key" {
  description   = "${var.kms_description}"
}