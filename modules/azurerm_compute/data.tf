
data "azurerm_subnet" "data" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_key_vault" "existing" {
  name                = "kv-test06012026"
  resource_group_name = "rg01"
}


data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault_secret" "Password" {
  name         = "Password"
  key_vault_id = data.azurerm_key_vault.existing.id
}

