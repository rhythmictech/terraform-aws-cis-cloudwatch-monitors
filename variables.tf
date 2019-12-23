variable "notification_arn" {
  type = string
}

variable "log_group" {
  type = string
}

variable "regions" {
  type    = list(string)
  default = ["us-east-1"]
}

variable "default_period" {
  type    = string
  default = "300"
}
