# Will restrict the AWS services to the listed ones for all prinvipals except the ones listed in the condition

locals {
  approved_services_only = length(var.scp_settings.allowed_services) == null ? {} : {
    "Statement" : [
      merge(
        {
          "Sid" : "AllowWhitelistedServices"
          "Effect" : "Deny"
          "Resource" : "*"
          "not_actions" : var.scp_settings.allowed_services
        },
        local.allowed_principal_arns
      )
    ]
  }
}

