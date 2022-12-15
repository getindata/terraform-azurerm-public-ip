variable "resource_group_name" {
  description = "Azure resource group name where resources will be deployed"
  type        = string
}

variable "location" {
  description = "Location where resources will be deployed. If not provided it will be read from resource group location"
  type        = string
  default     = null
}

variable "descriptor_name" {
  description = "Name of the descriptor used to form a resource name"
  type        = string
  default     = "azure-public-ip"
}

variable "diagnostic_settings" {
  description = "Enables diagnostics settings for a resource and streams the logs and metrics to any provided sinks"
  type = object({
    enabled               = optional(bool, false)
    logs_destinations_ids = optional(list(string), [])
  })
  default = {}
}
