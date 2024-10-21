## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.116.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.116.0 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_federated_identity_credential.oidc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential) | resource |
| [azurerm_user_assigned_identity.oidc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [github_actions_environment_secret.azure_client_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_secret) | resource |
| [github_actions_environment_secret.azure_subscription_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_secret) | resource |
| [github_actions_environment_secret.azure_tenant_id](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_secret) | resource |
| [github_repository_environment.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment) | resource |
| [azurerm_client_config.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the GitHub repository environment that will be created. | `string` | n/a | yes |
| <a name="input_federated_identity_credential"></a> [federated\_identity\_credential](#input\_federated\_identity\_credential) | Manages a Federated Identity Credentials. | <pre>object({<br>    audience = optional(list(string), ["api://AzureADTokenExchange"])<br>    issuer   = optional(string, "https://token.actions.githubusercontent.com")<br>  })</pre> | `{}` | no |
| <a name="input_github_config"></a> [github\_config](#input\_github\_config) | Manages a GitHub configuration. | <pre>object({<br>    owner = string<br>    repository = string<br>  })</pre> | n/a | yes |
| <a name="input_managed_identity"></a> [managed\_identity](#input\_managed\_identity) | Manages a User Assigned Identity. | <pre>object({<br>    name = string<br>    resource_group_name = string<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_uami_id"></a> [uami\_id](#output\_uami\_id) | The ID of the User Assigned Identity used for OIDC. |
| <a name="output_uami_principal_id"></a> [uami\_principal\_id](#output\_uami\_principal\_id) | The ID of the Service Principal object associated with the created Identity. |
| <a name="output_uami_rg_id"></a> [uami\_rg\_id](#output\_uami\_rg\_id) | The ID of the Resource Group that contains the User-assigned Managed Identity. |
