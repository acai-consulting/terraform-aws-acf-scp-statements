data "aws_iam_policy_document" "protect_security_services" {
  # https://docs.aws.amazon.com/controltower/latest/userguide/strongly-recommended-guardrails.html#disallow-root-auser-actions
  statement {
    sid       = "ProtectSecurityServices"
    effect    = "Deny"
    resources = ["*"]
    
    actions   = [        
      # CloudTrail
      "cloudtrail:StopLogging",
      "cloudtrail:DeleteTrail",
      # Config
      "config:DeleteConfigRule",
      "config:DeleteConfigurationRecorder",
      "config:DeleteDeliveryChannel",
      "config:StopConfigurationRecorder",
      # GuardDuty
      "guardduty:DeleteDetector",
      "guardduty:DeleteInvitations",
      "guardduty:DeleteIPSet",
      "guardduty:DeleteMembers",
      "guardduty:DeleteThreatIntelSet",
      "guardduty:DisassociateFromMasterAccount",
      "guardduty:DisassociateMembers",
      "guardduty:StopMonitoringMembers",
      "guardduty:UpdateDetector",
      # Security Hub
      "securityhub:DeleteInvitations",
      "securityhub:DisableSecurityHub",
      "securityhub:DisassociateFromMasterAccount",
      "securityhub:DeleteMembers",
      "securityhub:DisassociateMembers",
      # Access Analyzer
      "access-analyzer:DeleteAnalyzer"
    ]

    dynamic "condition" {
      for_each = length(var.scp_settings.allowed_principal_arns) > 0 ? [1] : []
      content {
        test     = "ArnNotLike"
        variable = "aws:PrincipalARN"
        values   = var.scp_settings.allowed_principal_arns
      }
    }
  }
}