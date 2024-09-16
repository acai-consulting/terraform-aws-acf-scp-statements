# this policy statement will deny all root user actions via the console
# Should be assigned to root-OU

# ❗ Important
#  SCPs don't affect users or roles in the management account. They affect only the member accounts in your organization.

locals {
  protect_root_user = {
    "Statement" : [
      {
        "Sid" : "DenyRootUser"
        "Effect" : "Deny"
        "Action" : "*"
        "Resource" : "*"
        "Condition" : {
          "StringLike" : {
            "aws:PrincipalArn" : [
              "arn:aws:iam::*:root"
            ]
          },
          "Bool" : {
            "aws:ViaAWSService" : "false"
          }
        }
      },
      {
        "Sid" : "DenyRootUserAccessKeys"
        "Effect" : "Deny"
        "Action" : "iam:CreateAccessKey"
        "Resource" : "*"
        "Condition" : {
          "StringLike" : {
            "aws:PrincipalArn" : [
              "arn:aws:iam::*:root"
            ]
          }
        }
      }
    ]
  }
}
