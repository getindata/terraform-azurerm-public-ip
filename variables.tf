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

variable "allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic"
  type        = string

  validation {
    condition     = contains(["Static", "Dynamic"], var.allocation_method)
    error_message = "Possible values are Static or Dynamic for the allocation_method variable"
  }
}

variable "zones" {
  description = "A collection containing the availability zone to allocate the Public IP in"
  type        = list(string)
  default     = null
}

variable "ip_version" {
  description = "The IP Version to use, IPv6 or IPv4"
  type        = string
  default     = "IPv4"

  validation {
    condition     = contains(["IPv4", "IPv6"], var.ip_version)
    error_message = "Possible values are IPv6 or IPv6 for the ip_version variable"
  }
}

variable "sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. Public IP Standard SKUs require allocation_method to be set to Static"
  type        = string
  default     = "Basic"

  validation {
    condition     = contains(["Basic", "Standard"], var.sku)
    error_message = "Possible values are Basic or Standard for the sku variable"
  }
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional. When sku_tier is set to Global, sku must be set to Standard"
  type        = string
  default     = "Regional"

  validation {
    condition     = contains(["Regional", "Global"], var.sku_tier)
    error_message = "Possible values are Regional or Global for the sku_tier variable"
  }
}
