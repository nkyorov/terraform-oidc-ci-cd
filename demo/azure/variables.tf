variable "environment" {
  description = ""
  type        = string
}

variable "location" {
  description = ""
  type        = string
  default     = "westeurope"
}

variable "managed_identity" {
  description = "Manages a User Assigned Identity."
  type = object({
    name                = string
    resource_group_name = string
  })
}

variable "federated_identity_credential" {
  description = "Manages a User Assigned Identity."
  type = object({
    audience = optional(list(string), ["api://AzureADTokenExchange"])
    issuer   = optional(string, "https://token.actions.githubusercontent.com")
  })
  default = {}
}

variable "github_config" {
  description = ""
  type = object({
    owner      = string
    repository = string
  })
}
