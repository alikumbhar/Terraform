resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "dynamodb-by-ali-kumbhar" # tagname of the bucket
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }


  tags = {
    Name        = "dynamodb-by-ali-kumbhar" # name of the bucket
  }
}