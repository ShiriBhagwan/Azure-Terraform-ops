resource "azurerm_subnet" "sb-subnet" {
  name = var.subnet_name
  virtual_network_name = var.vnet-name
  address_prefixes = var.address_prefixes
  resource_group_name = var.rg_name
}