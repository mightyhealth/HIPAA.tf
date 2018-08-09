module "dynamodb_table_test" {
  source         = "../dynamodb_table"
  name           = "test_table"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  attributes = [
    {
      name = "id"
      type = "S"
    },
  ]
}
