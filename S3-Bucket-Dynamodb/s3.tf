resource "aws_s3_bucket" "remote_s3" {
  bucket = "test-buck-by-alikumbhar"
  tags = {
    Name = "test-buck-by-alikumbhar"
  }
}
