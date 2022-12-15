output "name" {
  description = "Name of the resource"
  value       = one(azurerm_public_ip.this[*].name)
}

output "id" {
  description = "ID of the resource"
  value       = one(azurerm_public_ip.this[*].id)
}

output "resource_group_name" {
  description = "Name of the resource resource group"
  value       = one(azurerm_public_ip.this[*].resource_group_name)
}
