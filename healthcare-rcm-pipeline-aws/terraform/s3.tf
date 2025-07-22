resource "aws_s3_bucket" "rcm_raw" {
  bucket = "rcm-raw"
}

resource "aws_s3_bucket" "rcm_gold" {
  bucket = "rcm-gold"
}