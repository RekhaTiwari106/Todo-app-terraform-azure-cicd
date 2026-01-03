variable "mysqlserver" {
  description = "Map of MSSQL Servers with Databases"
  type = map(object({

    # =========================
    # SQL SERVER (Required)
    # =========================
    name                = optional(string)
    resource_group_name = string
    location            = string
    version             = optional(string)

    # =========================
    # SQL AUTHENTICATION (Optional)
    # =========================
    administrator_login          = optional(string)
    administrator_login_password = optional(string)

    # =========================
    # SECURITY & NETWORK (Optional)
    # =========================
    minimum_tls_version                      = optional(string)
    public_network_access_enabled            = optional(bool)
    outbound_network_restriction_enabled     = optional(bool)
    connection_policy                        = optional(string)
    express_vulnerability_assessment_enabled = optional(bool)

    # =========================
    # TRANSPARENT DATA ENCRYPTION (Optional)
    # =========================
    transparent_data_encryption_key_vault_key_id = optional(string)

    # =========================
    # MANAGED IDENTITY (Optional)
    # =========================
    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))

  

    # =========================
    # DATABASE (Required)
    # =========================
    db_name = string

    # =========================
    # DATABASE OPTIONS (Optional – for future use)
    # =========================
    db_sku_name = optional(string)
    db_tags     = optional(map(string))

    # =========================
    # TAGS (Optional)
    # =========================
    tags = optional(map(string))

  }))
}
