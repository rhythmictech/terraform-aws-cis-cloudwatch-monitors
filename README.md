# terraform-aws-cis-cloudwatch-monitors

[![](https://github.com/rhythmictech/terraform-aws-cis-cloudwatch-monitors/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-cis-cloudwatch-monitors/actions)

Creates CloudWatch metric filters and alerts as required by the CIS AWS Benchmark.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| default\_period |  | string | `"300"` | no |
| log\_group |  | string | n/a | yes |
| notification\_arn |  | string | n/a | yes |
| regions |  | list(string) | `[ "us-east-1" ]` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
