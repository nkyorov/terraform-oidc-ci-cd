resource "github_repository_environment" "this" {
  environment = var.environment
  repository  = var.github_config.repository
}

resource "github_actions_environment_secret" "azure_client_id" {
  repository      = var.github_config.repository
  environment     = github_repository_environment.this.environment
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = azurerm_user_assigned_identity.oidc.client_id
}

resource "github_actions_environment_secret" "azure_subscription_id" {
  repository      = var.github_config.repository
  environment     = github_repository_environment.this.environment
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = data.azurerm_client_config.this.subscription_id
}

resource "github_actions_environment_secret" "azure_tenant_id" {
  repository      = var.github_config.repository
  environment     = github_repository_environment.this.environment
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = data.azurerm_client_config.this.tenant_id
}
