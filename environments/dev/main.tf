 module "resource_group" { /* Calling the module to create resource groups */
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "SG" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
}


module "virtual_network_test" {
  depends_on           = [module.resource_group, module.SG]
  source               = "../../modules/azurerm_virtual_network"
  virtual_network_test = var.virtual_network_test
}

module "vms" {
  depends_on = [module.resource_group, module.virtual_network_test]
  source     = "../../modules/azurerm_compute"
  vms        = var.vms
}

module "keyvault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_keyvault"

}

module "mysqlserver" {
  depends_on  = [module.resource_group]
  source      = "../../modules/azurerm_sqlserver"
  mysqlserver = var.mysqlserver
}
