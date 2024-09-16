# Will restrict the AWS services to the listed ones for all prinvipals except the ones listed in the condition

data "aws_iam_policy_document" "approved_services_only" {
  count = length(var.scp_settings.allowed_services) > 0  ? 1 : 0

  statement {
    sid       = "AllowWhitelistedServices"
    effect    = "Deny"
    resources = ["*"]

    not_actions = var.scp_settings.allowed_services

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
