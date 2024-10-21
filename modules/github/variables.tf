variable "environment" {
  description = "The name of the GitHub repository environment that will be created."
  type        = string
}

variable "managed_identity" {
  description = "Manages a User Assigned Identity."
  type = object({
    name                = string
    resource_group_name = string
  })
}

variable "federated_identity_credential" {
  description = "Manages a Federated Identity Credentials."
  type = object({
    audience = optional(list(string), ["api://AzureADTokenExchange"])
    issuer   = optional(string, "https://token.actions.githubusercontent.com")
  })
  default = {}
}

variable "github_config" {
  description = "Manages a GitHub configuration."
  type = object({
    owner      = string
    repository = string
  })
}
