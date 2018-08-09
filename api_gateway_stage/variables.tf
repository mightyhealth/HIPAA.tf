variable "stage_name" {
  type = "string"
}

variable "rest_api_id" {}

variable "depends_on" {
  type    = "list"
  default = []
}
