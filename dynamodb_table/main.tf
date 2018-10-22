resource "aws_dynamodb_table" "table_no_destroy" {
  count = "${var.prevent_destroy? 1 : 0}"

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

  stream_view_type = "${var.stream_view_type}"

  stream_enabled = "${var.stream_enabled}"

  point_in_time_recovery {
    enabled = "${var.point_in_time_recovery}"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "table" {
  count          = "${var.prevent_destroy? 0 : 1}"
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

  stream_view_type = "${var.stream_view_type}"

  stream_enabled = "${var.stream_enabled}"

  point_in_time_recovery {
    enabled = "${var.point_in_time_recovery}"
  }

  lifecycle {
    prevent_destroy = false
  }
}
