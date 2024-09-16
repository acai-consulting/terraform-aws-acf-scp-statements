# Will restrict the AWS services to the listed ones for all prinvipals except the ones listed in the condition

locals {
  approved_services_only = length(var.scp_settings.allowed_services) == 0 ? {} : {
    "Statement" : [
      merge(
        {
          "Sid" : "AllowApprovedServices"
          "Effect" : "Deny"
          "Resource" : "*"
          "NotAction" : var.scp_settings.allowed_services
        },
        local.allowed_principal_arns
      )
    ]
  }
}

