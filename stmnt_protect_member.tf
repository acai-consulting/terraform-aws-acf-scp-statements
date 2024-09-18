# Inspired by: https://github.com/welldone-cloud/aws-scps-for-sandbox-and-training-accounts/blob/main/scp-deny-changing-account-baseline-configuration.json

locals {
  protect_member = {
    "Statement" : [
      merge(
        {
          "Sid" : "ProtectMembers"
          "Effect" : "Deny"
          "Resource" : "*"
          "Action" : [
            "account:CloseAccount",
            "account:DeleteAlternateContact",
            "account:DisableRegion",
            "account:EnableRegion",
            "account:PutAlternateContact",
            "account:PutChallengeQuestions",
            "account:PutContactInformation",
            "billing:PutContractInformation",
            "billing:UpdateBillingPreferences",
            "billing:UpdateIAMAccessPreference",
            "iam:CreateAccountAlias",
            "iam:DeleteAccountAlias",
            "iam:DeleteAccountPasswordPolicy",
            "iam:UpdateAccountEmailAddress",
            "iam:UpdateAccountName",
            "iam:UpdateAccountPasswordPolicy",
            "invoicing:PutInvoiceEmailDeliveryPreferences",
            "organizations:LeaveOrganization",
            "payments:CreatePaymentInstrument",
            "payments:DeletePaymentInstrument",
            "payments:MakePayment",
            "payments:UpdatePaymentPreferences",
            "purchase-orders:AddPurchaseOrder",
            "purchase-orders:DeletePurchaseOrder",
            "purchase-orders:ModifyPurchaseOrders",
            "purchase-orders:UpdateConsoleActionSetEnforced",
            "purchase-orders:UpdatePurchaseOrder",
            "purchase-orders:UpdatePurchaseOrderStatus",
            "tax:BatchPutTaxRegistration",
            "tax:DeleteTaxRegistration",
            "tax:PutTaxInheritance",
            "tax:PutTaxInterview",
            "tax:PutTaxRegistration",
            "tax:UpdateExemptions"
          ]
        },
        local.allowed_principal_arns
      )
    ]
  }
}

