variable "scp_settings" {
  type = object({
    regions = optional(object({
      primary_region    = string
      secondary_regions = optional(list(string),[])
    }), null)
    allowed_principal_arns = optional(list(string), [])
    allowed_services = optional(list(string), [
      "ec2:*",
      "s3:*",
      "iam:*",
      "lambda:*",
      "ecr:*",
      "ecs:*",
      "logs:*",
      "apigateway:*",
      "rds:*",
      "redshift:*",
      "elasticache:*",
      "cloudwatch:*",
      "secretsmanager:*"
      # add more as needed
    ])
  })
  default = {
    regions = null
    allowed_principal_arns = ["hohoho"]      
    allowed_services = [
      "ec2:*",
      "s3:*",
      "iam:*",
      "lambda:*",
      "ecr:*",
      "ecs:*",
      "logs:*",
      "apigateway:*",
      "rds:*",
      "redshift:*",
      "elasticache:*",
      "cloudwatch:*",
      "secretsmanager:*"
      # add more as needed      
    ]
  }
  validation {
    condition = var.scp_settings.regions == null ? true : (
      var.scp_settings.regions.primary_region != null &&
      var.scp_settings.regions.secondary_regions != null &&
      !contains(var.scp_settings.regions.secondary_regions, var.scp_settings.regions.primary_region)
    )
    error_message = "The primary region must not be included in the secondary regions."
  }  
}
