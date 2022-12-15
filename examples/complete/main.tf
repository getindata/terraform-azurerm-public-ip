module "resource_group" {
  source  = "github.com/getindata/terraform-azurerm-resource-group?ref=v1.2.0"
  context = module.this.context

  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "this" {
  name                = module.this.id
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tags                = module.this.tags
  sku                 = "PerGB2018"
}

module "public_ip" {
  source  = "../../"
  context = module.this.context

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  allocation_method = "Static"
  zones             = ["1", "2", "3"]
  ip_version        = "IPv4"

  sku      = "Standard"
  sku_tier = "Regional"

  diagnostic_settings = {
    enabled = true
    logs_destinations_ids = [
      azurerm_log_analytics_workspace.this.id
    ]
  }
}
