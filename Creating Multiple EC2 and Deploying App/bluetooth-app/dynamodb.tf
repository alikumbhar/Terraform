resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.env}-bluetooth-app-table" # taname of the bucket
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }


  tags = {
    Name        = "${var.env}-bluetooth-app-table" # name of the bucket
    Environment =  var.env
  }
}