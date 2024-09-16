# deny all actions except NotActions in all regions other than 
# for all principals other than the listed ones
locals {
  deny_regions = var.scp_settings.regions == null ? {} : {
    "Statement" : [
      merge(
        {
          # "DenyServicesOutsideApprovedRegions"
          "Sid" : "DenyServicesOutsideApprovedRegions"
          "Effect" : "Deny"
          "Resource" : ["*"]

          # Global Services
          "not_actions" = [
            "a4b:*",
            "access-analyzer:*",
            "acm:*",
            "aws-marketplace-management:*",
            "aws-marketplace:*",
            "aws-portal:*",
            "awsbillingconsole:*",
            "budgets:*",
            "ce:*",
            "chime:*",
            "cloudfront:*",
            "config:*",
            "cur:*",
            "directconnect:*",
            "ec2:DescribeRegions",
            "ec2:DescribeTransitGateways",
            "ec2:DescribeVpnGateways",
            "fms:*",
            "globalaccelerator:*",
            "health:*",
            "iam:*",
            "importexport:*",
            "kms:*",
            "mobileanalytics:*",
            "networkmanager:*",
            "organizations:*",
            "pricing:*",
            "route53:*",
            "route53domains:*",
            "route53resolver:Get*",
            "route53resolver:List*",
            "s3:*",
            "shield:*",
            "sts:*",
            "account:Get*",
            "compute-optimizer:*",
            "cost-optimization-hub:*",
            "support:*",
            "trustedadvisor:*",
            "waf-regional:*",
            "waf:*",
            "wafv2:*",
            "wellarchitected:*"
          ]

          "Condition" : {
            "StringNotEquals" : {
              "aws:RequestedRegion" : concat([var.scp_settings.regions.primary_region], var.scp_settings.regions.secondary_regions)
            }
          }
        },
        local.allowed_principal_arns
      )
    ]
  }
}

