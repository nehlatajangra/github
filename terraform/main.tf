resource "aws_s3_bucket" "neh-old-bucket1" {
  bucket = "${var.bucket_name}"

  tags = {
    Name        = "${var.name}"
    Environment = "${var.Environment}"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = "${aws_s3_bucket.neh-old-bucket1.id}"
  acl    = "${var.acl}"
}
output "bucket_id" {
  value = "${aws_s3_bucket.neh-old-bucket1.id}"
}
output "acl" {
  value = "${aws_s3_bucket.neh-old-bucket1.acl}"
}