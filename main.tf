data "azurerm_resource_group" "this" {
  count = module.this.enabled && var.location == null ? 1 : 0

  name = var.resource_group_name
}

#This is a sample resource
resource "azurerm_public_ip" "this" {
  count = module.this.enabled ? 1 : 0

  name                = local.name_from_descriptor
  location            = local.location
  resource_group_name = local.resource_group_name

  allocation_method = "Dynamic"
}

module "diagnostic_settings" {
  count = module.this.enabled && var.diagnostic_settings.enabled != null ? 1 : 0

  source  = "claranet/diagnostic-settings/azurerm"
  version = "6.2.0"

  resource_id           = one(azurerm_public_ip.this[*].id)
  logs_destinations_ids = var.diagnostic_settings.logs_destinations_ids
}
