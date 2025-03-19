# Will restrict the AWS services to the listed ones for all prinvipals except the ones listed in the condition
# Never combine two deny not_action statements with disjunct not_actions in single "OU-Hierarchy-Path"
# Specify permitted services in a single statement / SCP. They cannot be accumulated across multiple statements.

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

