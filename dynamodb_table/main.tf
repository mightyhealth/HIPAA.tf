locals {}

resource "aws_dynamodb_table" "table" {
  name           = "${var.name}"
  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"
  hash_key       = "${var.hash_key}"
  range_key      = "${var.range_key}"

  attribute = ["${var.attributes}"]

  server_side_encryption = {
    enabled = true
  }

  global_secondary_index = ["${var.global_secondary_index}"]

  point_in_time_recovery {
    enabled = "${var.point_in_time_recovery}"
  }
}
