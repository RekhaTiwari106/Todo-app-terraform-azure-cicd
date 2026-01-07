

resource "azurerm_mssql_server" "sql_server" {
  for_each = var.mysqlserver

  # Required
  name                = each.value.name 
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  version             = lookup(each.value, "version", "12.0")

  # SQL Authentication (optional)
  administrator_login = data.azurerm_key_vault_secret.username.value
  administrator_login_password = data.azurerm_key_vault_secret.Password.value

  # Security & Network
  minimum_tls_version                      = lookup(each.value, "minimum_tls_version", "1.2")
  public_network_access_enabled            = lookup(each.value, "public_network_access_enabled", true)
  outbound_network_restriction_enabled     = lookup(each.value, "outbound_network_restriction_enabled", false)
  connection_policy                        = lookup(each.value, "connection_policy", "Default")
  express_vulnerability_assessment_enabled = lookup(each.value, "express_vulnerability_assessment_enabled", false)

  # Transparent Data Encryption (CMK)
  transparent_data_encryption_key_vault_key_id = lookup(
    each.value,
    "transparent_data_encryption_key_vault_key_id",
    null
  )

  # Managed Identity
  dynamic "identity" {
    for_each = try(each.value.identity, null) != null ? [each.value.identity] : []

    content {
      type         = identity.value.type
      identity_ids = lookup(identity.value, "identity_ids", null)
    }
  }




  tags = lookup(each.value, "tags", {})
}


resource "azurerm_mssql_database" "db" {
  for_each   = var.mysqlserver
  depends_on = [azurerm_mssql_server.sql_server]

  name      = each.value.db_name
  server_id = azurerm_mssql_server.sql_server[each.key].id
  sku_name  = "S0"

  tags = {
    environment = "dev"
  }
}
