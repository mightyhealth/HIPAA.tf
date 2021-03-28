resource "aws_dynamodb_table" "table_no_destroy" {
  count = var.prevent_destroy? 1 : 0

  name           = var.name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  range_key      = var.range_key
  billing_mode   = var.billing_mode

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  server_side_encryption {
    enabled = true
  }


  dynamic "global_secondary_index" {
    for_each = var.global_secondary_index
    content {
      hash_key           = global_secondary_index.value.hash_key
      name               = global_secondary_index.value.name
      non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes", null)
      projection_type    = global_secondary_index.value.projection_type
      range_key          = lookup(global_secondary_index.value, "range_key", null)
      read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
      write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
    }
  }

  stream_view_type = var.stream_view_type

  stream_enabled = var.stream_enabled

  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "table" {
  count          = var.prevent_destroy? 0 : 1
  name           = var.name
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key
  range_key      = var.range_key
  billing_mode   = var.billing_mode

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  server_side_encryption {
    enabled = true
  }

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_index
    content {
      hash_key           = global_secondary_index.value.hash_key
      name               = global_secondary_index.value.name
      non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes", null)
      projection_type    = global_secondary_index.value.projection_type
      range_key          = lookup(global_secondary_index.value, "range_key", null)
      read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
      write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
    }
  }
  
  stream_view_type = var.stream_view_type

  stream_enabled = var.stream_enabled

  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }

  lifecycle {
    prevent_destroy = false
  }
}
