# Inspired by: https://github.com/welldone-cloud/aws-scps-for-sandbox-and-training-accounts/blob/main/scp-deny-making-agreements-purchases-and-reservations.json

locals {
  protect_financials = {
    "Statement" : [
      merge(
        {
          "Sid" : "ProtectMembers"
          "Effect" : "Deny"
          "Resource" : "*"
          "Action" : [
            "athena:CreateCapacityReservation",
            "aws-marketplace:AcceptAgreementRequest",
            "aws-marketplace:CreateAgreementRequest",
            "aws-marketplace:CreatePrivateMarketplaceRequests",
            "aws-marketplace:Subscribe",
            "backup:CreateLogicallyAirGappedBackupVault",
            "backup:PutBackupVaultLockConfiguration",
            "bedrock:CreateFoundationModelAgreement",
            "bedrock:CreateProvisionedModelThroughput",
            "cloudfront:CreateSavingsPlan",
            "devicefarm:PurchaseOffering",
            "directconnect:ConfirmCustomerAgreement",
            "dynamodb:PurchaseReservedCapacityOfferings",
            "ec2:AcceptReservedInstancesExchangeQuote",
            "ec2:CreateCapacityReservation",
            "ec2:CreateCapacityReservationFleet",
            "ec2:CreateReservedInstancesListing",
            "ec2:LockSnapshot",
            "ec2:PurchaseCapacityBlock",
            "ec2:PurchaseHostReservation",
            "ec2:PurchaseReservedInstancesOffering",
            "ec2:PurchaseScheduledInstances",
            "eks:CreateEksAnywhereSubscription",
            "elasticache:PurchaseReservedCacheNodesOffering",
            "elemental-appliances-software:CreateOrderV1",
            "elemental-appliances-software:SubmitOrderV1",
            "es:PurchaseReservedElasticsearchInstanceOffering",
            "es:PurchaseReservedInstanceOffering",
            "freertos:CreateSubscription",
            "glacier:CompleteVaultLock",
            "glacier:PurchaseProvisionedCapacity",
            "groundstation:ReserveContact",
            "iottwinmaker:UpdatePricingPlan",
            "iq:ApprovePaymentRequest",
            "mediaconnect:PurchaseOffering",
            "medialive:PurchaseOffering",
            "memorydb:PurchaseReservedNodesOffering",
            "outposts:CreateOrder",
            "panorama:ProvisionDevice",
            "quicksight:Subscribe",
            "quicksight:UpdateSPICECapacityConfiguration",
            "rbin:LockRule",
            "rds:PurchaseReservedDBInstancesOffering",
            "redshift:AcceptReservedNodeExchange",
            "redshift:PurchaseReservedNodeOffering",
            "route53domains:AcceptDomainTransferFromAnotherAwsAccount",
            "route53domains:RegisterDomain",
            "route53domains:RenewDomain",
            "route53domains:TransferDomain",
            "route53domains:TransferDomainToAnotherAwsAccount",
            "s3:PutBucketObjectLockConfiguration",
            "s3:PutObjectLegalHold",
            "s3:PutObjectRetention",
            "s3-object-lambda:PutObjectLegalHold",
            "s3-object-lambda:PutObjectRetention",
            "savingsplans:CreateSavingsPlan",
            "shield:CreateSubscription",
            "snowball:CreateJob",
            "snowball:CreateLongTermPricing"
          ]
        },
        local.allowed_principal_arns
      )
    ]
  }
}

