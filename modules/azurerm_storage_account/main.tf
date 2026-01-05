resource "azurerm_storage_account" "SG" {
  for_each = var.storage_accounts
  name                     = each.value.sg_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  tags = each.value.tags
}

resource "azurerm_storage_container" "SG_container" {
  for_each = var.storage_accounts
  name                  = each.value.container_name
  storage_account_id    = azurerm_storage_account.SG[each.key].id
  container_access_type = each.value.container_access_type
}

