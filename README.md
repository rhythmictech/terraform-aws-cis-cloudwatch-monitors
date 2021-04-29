# terraform-aws-cis-cloudwatch-monitors

[![](https://github.com/rhythmictech/terraform-aws-cis-cloudwatch-monitors/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-cis-cloudwatch-monitors/actions)

Creates CloudWatch metric filters and alerts as required by the CIS AWS Benchmark.

This module assumes that all of your CloudTrail logs (from all regions) are routing into a single CloudWatch log group specified in `log_group`. Use the `name_prefix` var if you
need to create this module for additional log groups.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.63.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_metric_filter.aws_config_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.cloudtrail_config_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.console_access_without_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.disable_or_delete_cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.failed_console_login](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.iam_policy_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.nacl_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.network_gateway_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.root_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.root_account_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.route_table_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.s3_bucket_policy_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.security_group_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.unauthorized_cloudtrail_calls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.vpc_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.aws_config_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cloudtrail_config_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.console_access_without_mfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.disable_or_delete_cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.failed_console_login](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.iam_policy_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.nacl_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.network_gateway_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.root_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.root_account_usage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.route_table_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.s3_bucket_policy_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.security_group_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.unauthorized_cloudtrail_calls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.vpc_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_group"></a> [log\_group](#input\_log\_group) | Name of CloudWatch Log Group to look for CloudTrail alerts in. | `string` | n/a | yes |
| <a name="input_notification_arn"></a> [notification\_arn](#input\_notification\_arn) | ARN of SNS topic to route notifications to. | `string` | n/a | yes |
| <a name="input_alarm_threshold_aws_config_change"></a> [alarm\_threshold\_aws\_config\_change](#input\_alarm\_threshold\_aws\_config\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_cloudtrail_config_change"></a> [alarm\_threshold\_cloudtrail\_config\_change](#input\_alarm\_threshold\_cloudtrail\_config\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_console_access_without_mfa"></a> [alarm\_threshold\_console\_access\_without\_mfa](#input\_alarm\_threshold\_console\_access\_without\_mfa) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_disable_or_delete_cmk"></a> [alarm\_threshold\_disable\_or\_delete\_cmk](#input\_alarm\_threshold\_disable\_or\_delete\_cmk) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_failed_console_login"></a> [alarm\_threshold\_failed\_console\_login](#input\_alarm\_threshold\_failed\_console\_login) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_iam_policy_change"></a> [alarm\_threshold\_iam\_policy\_change](#input\_alarm\_threshold\_iam\_policy\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_nacl_change"></a> [alarm\_threshold\_nacl\_change](#input\_alarm\_threshold\_nacl\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_network_gateway_change"></a> [alarm\_threshold\_network\_gateway\_change](#input\_alarm\_threshold\_network\_gateway\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_root_access"></a> [alarm\_threshold\_root\_access](#input\_alarm\_threshold\_root\_access) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_root_account_usage"></a> [alarm\_threshold\_root\_account\_usage](#input\_alarm\_threshold\_root\_account\_usage) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_route_table_change"></a> [alarm\_threshold\_route\_table\_change](#input\_alarm\_threshold\_route\_table\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_s3_bucket_policy_change"></a> [alarm\_threshold\_s3\_bucket\_policy\_change](#input\_alarm\_threshold\_s3\_bucket\_policy\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_security_group_change"></a> [alarm\_threshold\_security\_group\_change](#input\_alarm\_threshold\_security\_group\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_unauthorized_cloudtrail_calls"></a> [alarm\_threshold\_unauthorized\_cloudtrail\_calls](#input\_alarm\_threshold\_unauthorized\_cloudtrail\_calls) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_alarm_threshold_vpc_change"></a> [alarm\_threshold\_vpc\_change](#input\_alarm\_threshold\_vpc\_change) | The value against which the specified statistic is compared. | `number` | `1` | no |
| <a name="input_datapoints_to_alarm_aws_config_change"></a> [datapoints\_to\_alarm\_aws\_config\_change](#input\_datapoints\_to\_alarm\_aws\_config\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_cloudtrail_config_change"></a> [datapoints\_to\_alarm\_cloudtrail\_config\_change](#input\_datapoints\_to\_alarm\_cloudtrail\_config\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_console_access_without_mfa"></a> [datapoints\_to\_alarm\_console\_access\_without\_mfa](#input\_datapoints\_to\_alarm\_console\_access\_without\_mfa) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_disable_or_delete_cmk"></a> [datapoints\_to\_alarm\_disable\_or\_delete\_cmk](#input\_datapoints\_to\_alarm\_disable\_or\_delete\_cmk) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_failed_console_login"></a> [datapoints\_to\_alarm\_failed\_console\_login](#input\_datapoints\_to\_alarm\_failed\_console\_login) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_iam_policy_change"></a> [datapoints\_to\_alarm\_iam\_policy\_change](#input\_datapoints\_to\_alarm\_iam\_policy\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_nacl_change"></a> [datapoints\_to\_alarm\_nacl\_change](#input\_datapoints\_to\_alarm\_nacl\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_network_gateway_change"></a> [datapoints\_to\_alarm\_network\_gateway\_change](#input\_datapoints\_to\_alarm\_network\_gateway\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_root_access"></a> [datapoints\_to\_alarm\_root\_access](#input\_datapoints\_to\_alarm\_root\_access) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_root_account_usage"></a> [datapoints\_to\_alarm\_root\_account\_usage](#input\_datapoints\_to\_alarm\_root\_account\_usage) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_route_table_change"></a> [datapoints\_to\_alarm\_route\_table\_change](#input\_datapoints\_to\_alarm\_route\_table\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_s3_bucket_policy_change"></a> [datapoints\_to\_alarm\_s3\_bucket\_policy\_change](#input\_datapoints\_to\_alarm\_s3\_bucket\_policy\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_security_group_change"></a> [datapoints\_to\_alarm\_security\_group\_change](#input\_datapoints\_to\_alarm\_security\_group\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_unauthorized_cloudtrail_calls"></a> [datapoints\_to\_alarm\_unauthorized\_cloudtrail\_calls](#input\_datapoints\_to\_alarm\_unauthorized\_cloudtrail\_calls) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_datapoints_to_alarm_vpc_change"></a> [datapoints\_to\_alarm\_vpc\_change](#input\_datapoints\_to\_alarm\_vpc\_change) | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| <a name="input_default_period"></a> [default\_period](#input\_default\_period) | Period (in seconds) over which to look for threshold events. | `number` | `300` | no |
| <a name="input_metric_namespace"></a> [metric\_namespace](#input\_metric\_namespace) | Namespace to define all metrics in. | `string` | `"cis-cloudwatch-metrics"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix for all metric filters, metrics and alarms. This is not required but may be useful if you need to create this module multiple times for different log groups. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to supported resources. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
