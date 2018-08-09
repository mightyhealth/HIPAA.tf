output "name" {
  value = "${element(concat(aws_dynamodb_table.table_no_destroy.*.name,aws_dynamodb_table.table.*.name),0)}"
}
