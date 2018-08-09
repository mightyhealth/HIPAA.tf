module "dynamodb_table_test" {
  source         = "../dynamodb_table"
  name           = "test_table"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"

  # prevent_destroy should be removed or changed to true on production
  prevent_destroy = false

  attributes = [
    {
      name = "id"
      type = "S"
    },
  ]
}
