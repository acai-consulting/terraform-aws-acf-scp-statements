# ---------------------------------------------------------------------------------------------------------------------
# ¦ REQUIREMENTS
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 1.3.10"
}

# ---------------------------------------------------------------------------------------------------------------------
# ¦ LOCALS
# ---------------------------------------------------------------------------------------------------------------------
locals {
  allowed_principal_arns = length(var.scp_settings.allowed_principal_arns) == 0 ? {} : {
    "Condition" = {
      "ArnNotLike" = {
        "aws:PrincipalARN" = var.scp_settings.allowed_principal_arns
      }
    }
  }

  scp_statements = {
    "approved_services_only"    = jsonencode(local.approved_services_only)
    "deny_regions"              = jsonencode(local.deny_regions)
    "protect_financials"        = jsonencode(local.protect_financials)
    "protect_member"            = jsonencode(local.protect_member)
    "protect_root_user"         = jsonencode(local.protect_root_user)
    "protect_security_services" = jsonencode(local.protect_security_services)
  }
}
