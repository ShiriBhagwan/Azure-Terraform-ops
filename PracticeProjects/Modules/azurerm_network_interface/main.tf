resource "azurerm_network_interface" "sb-nic" {
  name                = var.nic-name
  location            = var.rg_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.nic-name}-ip"
    subnet_id                     = var.subnet-id
    private_ip_address_allocation = "Dynamic"
  }
}