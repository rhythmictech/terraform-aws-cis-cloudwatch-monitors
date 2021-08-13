# terraform-aws-cis-cloudwatch-monitors

[![](https://github.com/rhythmictech/terraform-aws-cis-cloudwatch-monitors/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-cis-cloudwatch-monitors/actions)

Creates CloudWatch metric filters and alerts as required by the CIS AWS Benchmark.

This module assumes that all of your CloudTrail logs (from all regions) are routing into a single CloudWatch log group specified in `log_group`. Use the `name_prefix` var if you
need to create this module for additional log groups.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 2.63.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.63.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| log\_group | Name of CloudWatch Log Group to look for CloudTrail alerts in. | `string` | n/a | yes |
| notification\_arn | ARN of SNS topic to route notifications to. | `string` | n/a | yes |
| alarm\_threshold\_aws\_config\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_cloudtrail\_config\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_console\_access\_without\_mfa | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_disable\_or\_delete\_cmk | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_failed\_console\_login | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_iam\_policy\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_nacl\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_network\_gateway\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_root\_access | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_root\_account\_usage | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_route\_table\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_s3\_bucket\_policy\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_security\_group\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_unauthorized\_cloudtrail\_calls | The value against which the specified statistic is compared. | `number` | `1` | no |
| alarm\_threshold\_vpc\_change | The value against which the specified statistic is compared. | `number` | `1` | no |
| core\_alarms\_only | Set to true to only get the core/important alarms | `bool` | `false` | no |
| datapoints\_to\_alarm\_aws\_config\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_cloudtrail\_config\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_console\_access\_without\_mfa | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_disable\_or\_delete\_cmk | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_failed\_console\_login | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_iam\_policy\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_nacl\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_network\_gateway\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_root\_access | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_root\_account\_usage | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_route\_table\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_s3\_bucket\_policy\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_security\_group\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_unauthorized\_cloudtrail\_calls | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| datapoints\_to\_alarm\_vpc\_change | (Optional) The number of datapoints that must be breaching to trigger the alarm. | `number` | `null` | no |
| default\_period | Period (in seconds) over which to look for threshold events. | `number` | `300` | no |
| metric\_namespace | Namespace to define all metrics in. | `string` | `"cis-cloudwatch-metrics"` | no |
| name\_prefix | Prefix for all metric filters, metrics and alarms. This is not required but may be useful if you need to create this module multiple times for different log groups. | `string` | `""` | no |
| tags | Tags to apply to supported resources. | `map(string)` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
