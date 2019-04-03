variable "name" {
  type = "string"
}

variable "billing_mode" {
  default = "PROVISIONED"
}

variable "read_capacity" {
  default = 0
}

variable "write_capacity" {
    default = 0
}

variable "hash_key" {
  type = "string"
}

variable "range_key" {
  type    = "string"
  default = ""
}

variable "attributes" {
  type    = "list"
  default = []
}

variable "global_secondary_index" {
  type    = "list"
  default = []
}

variable "point_in_time_recovery" {
  default = true
}

variable "prevent_destroy" {
  default = true
}

variable "stream_view_type" {
  default = ""
}

variable "stream_enabled" {
  default = false
}
