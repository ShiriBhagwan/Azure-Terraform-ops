module "rg-module" {
  source      = "../../Modules/azurerm_resource_group"
  rg_name     = var.rg_name
  rg_location = var.rg_location
}

module "vnet-module" {
  depends_on    = [module.rg-module]
  source        = "../../Modules/azurerm_virtual_network"
  rg_name       = module.rg-module.name
  vnet_location = module.rg-module.location
  address_space = var.address_space
  vnet-name     = var.vnet-name
}

module "subnet-module" {
  depends_on = [module.vnet-module]

  source           = "../../Modules/azurerm_subnet"
  for_each         = var.subnet_details
  subnet_name      = each.key
  address_prefixes = each.value
  rg_name          = module.rg-module.name
  vnet-name        = module.vnet-module.name
}

module "nic-module" {
  depends_on  = [module.subnet-module]
  source      = "../../Modules/azurerm_network_interface"
  for_each    = var.nic_details
  nic-name    = each.key
  rg_name     = module.rg-module.name
  rg_location = module.rg-module.location
  subnet-id   = module.subnet-module[each.value].id
}

module "vm-module" {
  depends_on = [module.nic-module]

  source      = "../../Modules/azurerm_virtual_machine"
  for_each    = var.vm_details
  vm_name     = each.key
  rg_name     = module.rg-module.name
  rg_location = module.rg-module.location
  nic_id      = [module.nic-module[each.value].id]
}
