# terraform-aws-acf-scp-templates Terraform module

<!-- LOGO -->
<a href="https://acai.gmbh">    
  <img src="https://github.com/acai-consulting/acai.public/raw/main/logo/logo_github_readme.png" alt="acai logo" title="ACAI" align="right" height="75" />
</a>

<!-- SHIELDS -->
[![Maintained by acai.gmbh][acai-shield]][acai-url]
[![module-version-shield]][module-release-url]
![terraform-version-shield]

<!-- DESCRIPTION -->
[Terraform][terraform-url] module to render sample statements for AWS Service Control Policies (SCPs).

The rendered statements can be used with the [ACAI ACF](https://acai.gmbh/solutions/acf/) module [terraform-aws-acf-scp](https://github.com/acai-consulting/terraform-aws-acf-scp).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.10 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_scp_settings"></a> [scp\_settings](#input\_scp\_settings) | n/a | <pre>object({<br>    regions = optional(object({<br>      primary_region    = string<br>      secondary_regions = optional(list(string), [])<br>    }), null)<br>    allowed_principal_arns = optional(list(string), [])<br>    allowed_services = optional(list(string), [<br>      "ec2:*",<br>      "s3:*",<br>      "iam:*",<br>      "lambda:*",<br>      "ecr:*",<br>      "ecs:*",<br>      "logs:*",<br>      "apigateway:*",<br>      "rds:*",<br>      "redshift:*",<br>      "elasticache:*",<br>      "cloudwatch:*",<br>      "secretsmanager:*"<br>      # add more as needed<br>    ])<br>  })</pre> | <pre>{<br>  "allowed_principal_arns": [],<br>  "allowed_services": [<br>    "ec2:*",<br>    "s3:*",<br>    "iam:*",<br>    "lambda:*",<br>    "ecr:*",<br>    "ecs:*",<br>    "logs:*",<br>    "apigateway:*",<br>    "rds:*",<br>    "redshift:*",<br>    "elasticache:*",<br>    "cloudwatch:*",<br>    "secretsmanager:*"<br>  ],<br>  "regions": null<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_scp_statements"></a> [scp\_statements](#output\_scp\_statements) | n/a |
| <a name="output_scp_statements_lengths"></a> [scp\_statements\_lengths](#output\_scp\_statements\_lengths) | n/a |
<!-- END_TF_DOCS -->

<!-- AUTHORS -->
## Authors

This module is maintained by [ACAI GmbH][acai-url].

<!-- LICENSE -->
## License

See [LICENSE][license-url] for full details.

<!-- COPYRIGHT -->
<br />
<br />
<p align="center">Copyright &copy; 2024 ACAI GmbH</p>

<!-- MARKDOWN LINKS & IMAGES -->
[acai-url]: https://acai.gmbh
[acai-shield]: https://img.shields.io/badge/maintained_by-acai.gmbh-CB224B?style=flat
[module-version-shield]: https://img.shields.io/badge/module_version-1.0.5-CB224B?style=flat
[module-release-url]: https://github.com/acai-consulting/terraform-aws-acf-scp/releases
[terraform-version-shield]: https://img.shields.io/badge/tf-%3E%3D1.3.10-blue.svg?style=flat&color=blueviolet
[license-url]: https://github.com/acai-consulting/terraform-aws-acf-scp/tree/main/LICENSE.md
[terraform-url]: https://www.terraform.io
