output "name" {
  description = "Name of the Azure Public IP"
  value       = one(azurerm_public_ip.this[*].name)
}

output "id" {
  description = "ID of the Azure Public IP"
  value       = one(azurerm_public_ip.this[*].id)
}

output "resource_group_name" {
  description = "Name of the Azure Public IP resource group"
  value       = one(azurerm_public_ip.this[*].resource_group_name)
}

output "ip_address" {
  description = "The IP address value that was allocated"
  value       = one(azurerm_public_ip.this[*].ip_address)
}

output "fqdn" {
  description = "Fully qualified domain name of the A DNS record associated with the public IP"
  value       = one(azurerm_public_ip.this[*].fqdn)
}
