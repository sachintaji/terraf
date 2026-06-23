resource "aws_dynamodb_table" "mytable" {
  name         = "mytable"
  hash_key     = "id"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "id"
    type = "S"
  }
}
