#Create one resource group
resource "azurerm_resource_group" "sb-rg" {
  name = var.rg_name
  location = var.rg_location
}