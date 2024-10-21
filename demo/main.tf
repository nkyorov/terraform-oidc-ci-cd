data "azurerm_resource_group" "this" {
  name = var.managed_identity.resource_group_name
}

module "azure-github-oidc" {
  source = "../modules/github"

  environment      = var.environment
  managed_identity = var.managed_identity
  github_config    = var.github_config
}

# Grant Contributor access to the RG
resource "azurerm_role_assignment" "contributor" {
  scope                = module.azure-github-oidc.uami_rg_id
  role_definition_name = "Contributor"
  principal_id         = module.azure-github-oidc.uami_principal_id
}
