variable "default_period" {
  default     = 300
  description = "Period (in seconds) over which to look for threshold events."
  type        = number
}

variable "log_group" {
  description = "Name of CloudWatch Log Group to look for CloudTrail alerts in."
  type        = string
}

variable "metric_namespace" {
  default     = "cis-cloudwatch-metrics"
  description = "Namespace to define all metrics in."
  type        = string
}

variable "name_prefix" {
  default     = ""
  description = "Prefix for all metric filters, metrics and alarms. This is not required but may be useful if you need to create this module multiple times for different log groups."
  type        = string
}

variable "notification_arn" {
  description = "ARN of SNS topic to route notifications to."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to supported resources."
  type        = map(string)
}
