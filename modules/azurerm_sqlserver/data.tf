


data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault_secret" "Password" {
  name         = "Password"
  key_vault_id = data.azurerm_key_vault.existing.id
}

data "azurerm_key_vault" "existing" {
  name                = "kv-test06012026"
  resource_group_name = "rg01"
}
