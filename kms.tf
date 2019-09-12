resource "aws_kms_key" "aws_kms_key" {
  count         = "${length(var.kms_description)}"
  description   = "${var.kms_description[count.index]}"
}