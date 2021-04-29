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

##########################################
# Alarm Thresholds
##########################################
variable "alarm_threshold_aws_config_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_cloudtrail_config_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_console_access_without_mfa" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_disable_or_delete_cmk" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_failed_console_login" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_iam_policy_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_nacl_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_network_gateway_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_root_access" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_root_account_usage" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_route_table_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_s3_bucket_policy_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_security_group_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_unauthorized_cloudtrail_calls" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "alarm_threshold_vpc_change" {
  default     = 1
  description = "The value against which the specified statistic is compared."
  type        = number
}
