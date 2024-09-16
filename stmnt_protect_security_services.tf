locals {
  protect_security_services = {
    "Statement" : [
      merge(
        {
          "Sid" : "ProtectSecurityServices",
          "Effect" : "Deny",
          "Resource" : "*",
          "Action" : [
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
          ],
        },
        local.allowed_principal_arns
      )
    ]
  }
}

