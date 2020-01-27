# Metric Filter/Alarm for unauthorized CloudTrail calls
resource "aws_cloudwatch_log_metric_filter" "unauthorized_cloudtrail_calls" {
  name           = "${var.name_prefix}unauthorized-cloudtrail-calls"
  log_group_name = var.log_group
  pattern        = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") } "

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}UnauthorizedCloudtrailCallCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "unauthorized_cloudtrail_calls" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}unauthorized-cloudtrail-calls"
  alarm_description   = "Monitor unauthorized API calls through cloudtrail"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}UnauthorizedCloudtrailCallCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for root access
resource "aws_cloudwatch_log_metric_filter" "root_access" {
  name           = "${var.name_prefix}root-access"
  log_group_name = var.log_group
  pattern        = "{$.userIdentity.type = \"Root\"}"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}RootAccessCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "root_access" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}root_access"
  alarm_description   = "Monitor usage of root credentials"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}RootAccess"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for console access without MFA
resource "aws_cloudwatch_log_metric_filter" "console_access_without_mfa" {
  name           = "${var.name_prefix}console-access-without-mfa"
  log_group_name = var.log_group
  pattern        = "{($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\")}"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}ConsoleAccessWithoutMfaCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "console_access_without_mfa" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}console-access-without-mfa"
  alarm_description   = "Monitor console logins without mfa"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}ConsoleAccessWithoutMfa"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for usage of root account
resource "aws_cloudwatch_log_metric_filter" "root_account_usage" {
  name           = "${var.name_prefix}root-account-usage"
  log_group_name = var.log_group
  pattern        = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}RootAccountUsageCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "root_account_usage" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}root-account-usage"
  alarm_description   = "Monitor root account usage"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}RootAccountUsageCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1

}

# Metric Filter/Alarm for IAM policy changes
resource "aws_cloudwatch_log_metric_filter" "iam_policy_change" {
  name           = "${var.name_prefix}iam-policy-change"
  log_group_name = var.log_group
  pattern        = "{($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}IamPolicyChangeCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "iam_policy_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}iam-policy-change"
  alarm_description   = "Monitor IAM policy changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}IamPolicyChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for CloudTrail configuration changes
resource "aws_cloudwatch_log_metric_filter" "cloudtrail_config_change" {
  name           = "${var.name_prefix}cloudtrail-config-change"
  log_group_name = var.log_group
  pattern        = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}CloudTrailConfigChangeCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "cloudtrail_config_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}cloudtrail-config-change"
  alarm_description   = "Monitor CloudTrail configuration changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}CloudTrailConfigChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for failed console logins
resource "aws_cloudwatch_log_metric_filter" "failed_console_login" {
  name           = "${var.name_prefix}failed-console-login"
  log_group_name = var.log_group
  pattern        = "{($.eventName=ConsoleLogin) && ($.errorMessage=\"Failed authentication\")}"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}FailedConsoleLoginCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "failed_console_login" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}failed-console-login"
  alarm_description   = "Monitor failed console logins"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}FailedConsoleLoginCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for deleted KMS keys
resource "aws_cloudwatch_log_metric_filter" "disable_or_delete_cmk" {
  name           = "${var.name_prefix}disable-or-delete-cmk"
  log_group_name = var.log_group
  pattern        = "{($.eventSource = kms.amazonaws.com) && (($.eventName=DisableKey)||($.eventName=ScheduleKeyDeletion)) }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}DisableOrDeleteCmkCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "disable_or_delete_cmk" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}disable-or-delete-cmk"
  alarm_description   = "Monitor disabled or deleted KMS keys"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}DisableOrDeleteCmkCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for s3 bucket policy changes
resource "aws_cloudwatch_log_metric_filter" "s3_bucket_policy_change" {
  name           = "${var.name_prefix}s3-bucket-policy-change"
  log_group_name = var.log_group
  pattern        = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}S3BucketPolicyChangeCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "s3_bucket_policy_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}s3-bucket-policy-change"
  alarm_description   = "Monitor s3 bucket policy changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}S3BucketPolicyChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for AWS Config changes
resource "aws_cloudwatch_log_metric_filter" "aws_config_change" {
  name           = "${var.name_prefix}aws-config-change"
  log_group_name = var.log_group
  pattern        = "{ ($.eventSource = config.amazonaws.com) && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel) ||($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder)) }"

  metric_transformation {
    name      = "${var.name_prefix}AwsConfigChangeCount"
    namespace = var.metric_namespace
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "aws_config_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}aws-config-change"
  alarm_description   = "Monitor for AWS Config changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}AwsConfigChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for Security Group changes
resource "aws_cloudwatch_log_metric_filter" "security_group_change" {
  name           = "${var.name_prefix}security-group-change"
  log_group_name = var.log_group
  pattern        = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}SecurityGroupChangeCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "security_group_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}security-group-change"
  alarm_description   = "Monitor for security group changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}SecurityGroupChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for NACL changes
resource "aws_cloudwatch_log_metric_filter" "nacl_change" {
  name           = "${var.name_prefix}nacl-change"
  log_group_name = var.log_group
  pattern        = "{ ($.eventName = CreateNetworkAcl) || ($.eventName = CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName = DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) || ($.eventName = ReplaceNetworkAclAssociation) }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}NaclChangeCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "nacl_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}nacl-change"
  alarm_description   = "Monitor for NACL changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}NaclChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for network gateway changes
resource "aws_cloudwatch_log_metric_filter" "network_gateway_change" {
  name           = "${var.name_prefix}network-gateway-change"
  log_group_name = var.log_group
  pattern        = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}NetworkGatewayChangeCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "network_gateway_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}network-gateway-change"
  alarm_description   = "Monitor for network gateway changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}NetworkGatewayChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for route table changes
resource "aws_cloudwatch_log_metric_filter" "route_table_change" {
  name           = "${var.name_prefix}route-table-change"
  log_group_name = var.log_group
  pattern        = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}RouteTableChangeCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "route_table_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}route-table-change"
  alarm_description   = "Monitor for route table changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}RouteTableChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}

# Metric Filter/Alarm for route table changes
resource "aws_cloudwatch_log_metric_filter" "vpc_change" {
  name           = "${var.name_prefix}vpc-change"
  log_group_name = var.log_group
  pattern        = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"

  metric_transformation {
    default_value = 0
    name          = "${var.name_prefix}VpcChangeCount"
    namespace     = var.metric_namespace
    value         = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "vpc_change" {
  alarm_actions       = [var.notification_arn]
  alarm_name          = "${var.name_prefix}vpc-change"
  alarm_description   = "Monitor for VPC config changes"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "${var.name_prefix}VpcChangeCount"
  namespace           = var.metric_namespace
  period              = var.default_period
  statistic           = "Sum"
  tags                = var.tags
  threshold           = 1
}
