output "uami_id" {
  description = "The ID of the User Assigned Identity used for OIDC."
  value       = azurerm_user_assigned_identity.oidc.id
}

output "uami_principal_id" {
  description = "The ID of the Service Principal object associated with the created Identity."
  value       = azurerm_user_assigned_identity.oidc.principal_id
}

output "uami_rg_id" {
  description = "The ID of the Resource Group that contains the User-assigned Managed Identity."
  value       = data.azurerm_resource_group.this.id
}
