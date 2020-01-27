# terraform-aws-cis-cloudwatch-monitors

[![](https://github.com/rhythmictech/terraform-aws-cis-cloudwatch-monitors/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-cis-cloudwatch-monitors/actions)

Creates CloudWatch metric filters and alerts as required by the CIS AWS Benchmark.

This module assumes that all of your CloudTrail logs (from all regions) are routing into a single CloudWatch log group specified in `log_group`. Use the `name_prefix` var if you
need to create this module for additional log groups.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| default\_period | Period \(in seconds\) over which to look for threshold events. | number | `"300"` | no |
| log\_group | Name of CloudWatch Log Group to look for CloudTrail alerts in. | string | n/a | yes |
| metric\_namespace | Namespace to define all metrics in. | string | `"cis-cloudwatch-metrics"` | no |
| name\_prefix | Prefix for all metric filters, metrics and alarms. This is not required but may be useful if you need to create this module multiple times for different log groups. | string | `""` | no |
| notification\_arn | ARN of SNS topic to route notifications to. | string | n/a | yes |
| tags | Tags to apply to supported resources. | map(string) | `{}` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
