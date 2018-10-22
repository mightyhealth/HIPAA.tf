output "name" {
  value = "${element(concat(aws_dynamodb_table.table_no_destroy.*.name,aws_dynamodb_table.table.*.name),0)}"
}

output "stream_arn" {
  value = "${element(concat(aws_dynamodb_table.table_no_destroy.*.stream_arn,aws_dynamodb_table.table.*.stream_arn),0)}"
}
