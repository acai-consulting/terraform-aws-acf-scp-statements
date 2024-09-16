# this policy statement will deny all root user actions via the console
# Should be assigned to root-OU

# ❗ Important
#  SCPs don't affect users or roles in the management account. They affect only the member accounts in your organization.

data "aws_iam_policy_document" "protect_root_user" {
  # https://docs.aws.amazon.com/controltower/latest/userguide/strongly-recommended-guardrails.html#disallow-root-auser-actions
  statement {
    sid       = "DenyRootUser"
    effect    = "Deny"
    resources = ["*"]

    actions   = ["*"]

    condition {
      test     = "StringLike"
      variable = "aws:PrincipalArn"
      values = [
        "arn:aws:iam::*:root"
      ]
    }
    condition {
      test     = "Bool"
      variable = "aws:ViaAWSService"
      values   = [false]
    }
  }

  # https://docs.aws.amazon.com/controltower/latest/userguide/strongly-recommended-guardrails.html#disallow-root-access-keys
  statement {
    sid       = "DenyRootUserAccessKeys"
    effect    = "Deny"
    resources = ["*"]

    actions   = ["iam:CreateAccessKey"]

    condition {
      test     = "StringLike"
      variable = "aws:PrincipalArn"
      values   = ["arn:aws:iam::*:root"]
    }
  }
}
