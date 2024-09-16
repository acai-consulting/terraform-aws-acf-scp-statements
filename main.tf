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
      "StringNotEquals" = {
        "aws:PrincipalARN" = var.scp_settings.allowed_principal_arns
      }
    }
  }

  scp_statements = {
    "approved_services_only"    = length(var.scp_settings.allowed_services) > 0 ? data.aws_iam_policy_document.approved_services_only[0].json : ""
    "deny_regions"              = var.scp_settings.regions != null ? data.aws_iam_policy_document.deny_regions[0].json : ""
    "protect_root_user"         = data.aws_iam_policy_document.protect_root_user.json
    "protect_security_services" = data.aws_iam_policy_document.protect_security_services
  }
}
