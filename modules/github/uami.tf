locals {
  federated_identity_credential = {
    name    = "${var.github_config.owner}-${var.github_config.repository}-${var.environment}"
    subject = "repo:${var.github_config.owner}/${var.github_config.repository}:environment:${var.environment}"
  }
}

data "azurerm_resource_group" "this" {
  name = var.managed_identity.resource_group_name
}

resource "azurerm_user_assigned_identity" "oidc" {
  name                = var.managed_identity.name
  resource_group_name = data.azurerm_resource_group.this.name
  location            = data.azurerm_resource_group.this.location
}

resource "azurerm_federated_identity_credential" "oidc" {
  name                = local.federated_identity_credential.name
  resource_group_name = data.azurerm_resource_group.this.name
  audience            = var.federated_identity_credential.audience
  issuer              = var.federated_identity_credential.issuer
  parent_id           = azurerm_user_assigned_identity.oidc.id
  subject             = local.federated_identity_credential.subject
}
