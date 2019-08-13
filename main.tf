# Metric Filter/Alarm for unauthorized CloudTrail calls (3.1)
resource "aws_cloudwatch_log_metric_filter" "unauthorized_cloudtrail_calls" {
  name           = "unauthorized-cloudtrail-calls"
  pattern        = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") } "
  log_group_name = var.log_group

  metric_transformation {
    name      = "UnauthorizedCloudtrailCallCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "unauthorized_cloudtrail_calls" {
  #count                     = "${length(var.regions)}"
  #alarm_name                = "root_access-${var.regions[count.index]}"
  alarm_name        = "unauthorized-cloudtrail-calls"
  alarm_description = "Monitor unauthorized API calls through cloudtrail"
  metric_name       = "UnauthorizedCloudtrailCallCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for root access (1.12)
resource "aws_cloudwatch_log_metric_filter" "root_access" {
  name           = "root-access"
  pattern        = "{$.userIdentity.type = \"Root\"}"
  log_group_name = var.log_group

  metric_transformation {
    name      = "RootAccessCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "root_access" {
  alarm_name        = "root_access"
  alarm_description = "Monitor usage of root credentials"
  metric_name       = "RootAccess"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for console access without MFA (3.2)
resource "aws_cloudwatch_log_metric_filter" "console_access_without_mfa" {
  name           = "console-access-without-mfa"
  pattern        = "{ ($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\") }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "ConsoleAccessWithoutMfaCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "console_access_without_mfa" {
  alarm_name        = "console-access-without-mfa"
  alarm_description = "Monitor console logins without mfa"
  metric_name       = "ConsoleAccessWithoutMfa"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for usage of root account (3.3)
resource "aws_cloudwatch_log_metric_filter" "root_account_usage" {
  name           = "root-account-usage"
  pattern        = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "RootAccountUsageCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "root_account_usage" {
  alarm_name        = "root-account-usage"
  alarm_description = "Monitor root account usage"
  metric_name       = "RootAccountUsageCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for IAM policy changes (3.4)
resource "aws_cloudwatch_log_metric_filter" "iam_policy_change" {
  name           = "iam-policy-change"
  pattern        = "{($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
  log_group_name = var.log_group

  metric_transformation {
    name      = "IamPolicyChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "iam_policy_change" {
  alarm_name        = "iam-policy-change"
  alarm_description = "Monitor IAM policy changes"
  metric_name       = "IamPolicyChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for CloudTrail configuration changes (3.5)
resource "aws_cloudwatch_log_metric_filter" "cloudtrail_config_change" {
  name           = "cloudtrail-config-change"
  pattern        = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "CloudTrailConfigChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "cloudtrail_config_change" {
  alarm_name        = "cloudtrail-config-change"
  alarm_description = "Monitor CloudTrail configuration changes"
  metric_name       = "CloudTrailConfigChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for failed console logins (3.6)
resource "aws_cloudwatch_log_metric_filter" "failed_console_login" {
  name           = "failed-console-login"
  pattern        = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "FailedConsoleLoginCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "failed_console_login" {
  alarm_name        = "failed-console-login"
  alarm_description = "Monitor failed console logins"
  metric_name       = "FailedConsoleLoginCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for deleted KMS keys (3.7)
resource "aws_cloudwatch_log_metric_filter" "disable_or_delete_cmk" {
  name           = "disable-or-delete-cmk"
  pattern        = "{($.eventSource = kms.amazonaws.com) && (($.eventName=DisableKey)||($.eventName=ScheduleKeyDeletion)) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "DisableOrDeleteCmkCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "disable_or_delete_cmk" {
  alarm_name        = "disable-or-delete-cmk"
  alarm_description = "Monitor disabled or deleted KMS keys"
  metric_name       = "DisableOrDeleteCmkCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for s3 bucket policy changes (3.8)
resource "aws_cloudwatch_log_metric_filter" "s3_bucket_policy_change" {
  name           = "s3-bucket-policy-change"
  pattern        = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "S3BucketPolicyChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_bucket_policy_change" {
  alarm_name        = "s3-bucket-policy-change"
  alarm_description = "Monitor s3 bucket policy changes"
  metric_name       = "S3BucketPolicyChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for AWS Config changes (3.9)
resource "aws_cloudwatch_log_metric_filter" "aws_config_change" {
  name           = "aws-config-change"
  pattern        = "{ ($.eventSource = config.amazonaws.com) && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel) ||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "AwsConfigChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "aws_config_change" {
  alarm_name        = "aws-config-change"
  alarm_description = "Monitor for AWS Config changes"
  metric_name       = "AwsConfigChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for Security Group changes (3.10)
resource "aws_cloudwatch_log_metric_filter" "security_group_change" {
  name           = "security-group-change"
  pattern        = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "SecurityGroupChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "security_group_change" {
  alarm_name        = "security-group-change"
  alarm_description = "Monitor for security group changes"
  metric_name       = "SecurityGroupChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for NACL changes (3.11)
resource "aws_cloudwatch_log_metric_filter" "nacl_change" {
  name           = "nacl-change"
  pattern        = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "NaclChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "nacl_change" {
  alarm_name        = "nacl-change"
  alarm_description = "Monitor for NACL changes"
  metric_name       = "NaclChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for network gateway changes (3.12)
resource "aws_cloudwatch_log_metric_filter" "network_gateway_change" {
  name           = "network-gateway-change"
  pattern        = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "NetworkGatewayChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "network_gateway_change" {
  alarm_name        = "network-gateway-change"
  alarm_description = "Monitor for network gateway changes"
  metric_name       = "NetworkGatewayChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for route table changes (3.13)
resource "aws_cloudwatch_log_metric_filter" "route_table_change" {
  name           = "route-table-change"
  pattern        = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "RouteTableChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "route_table_change" {
  alarm_name        = "route-table-change"
  alarm_description = "Monitor for route table changes"
  metric_name       = "RouteTableChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

# Metric Filter/Alarm for VPC Changes (3.14)
resource "aws_cloudwatch_log_metric_filter" "vpc_change" {
  name           = "vpc-change"
  pattern        = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"
  log_group_name = var.log_group

  metric_transformation {
    name      = "VpcChangeCount"
    namespace = "cis-cloudwatch-metrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "vpc_change" {
  alarm_name        = "vpc-change"
  alarm_description = "Monitor for VPC config changes"
  metric_name       = "VpcChangeCount"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  namespace           = "cis-cloudwatch-metrics"
  period              = var.default_period
  statistic           = "Sum"
  threshold           = "1"

  alarm_actions = [var.notification_arn]
}

