rgs = {
  rgs1 = {
    name                     = "rg01"
    location                 = "centralindia"
  }
}

storage_accounts = {
  sa1 = {
    sg_name                  = "priyanshsg05012026"
    resource_group_name      = "rg01"
    location                 = "centralindia"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
      environment = "dev"
      owner       = "team-a"
    }

    container_name        = "fortfstate"
    container_access_type = "private"
  }
}

virtual_network_test = {
  vnet1 = {
    name                = "vnet_rekha"
    location            = "centralindia"
    resource_group_name = "resourcegrouprekha"
    address_space       = ["10.0.0.0/24"]
    subnet = [
      {
        name = "subnet_rekha"
      address_prefixes = ["10.0.0.0/25"] }
      ,
      {
        name             = "subnet_rekha2"
        address_prefixes = ["10.0.0.128/25"]
      }
    ]
} }

vms = {
  vm1 = {
    VM_name              = "frontend-vm"
    subnet_name          = "subnet_rekha"
    virtual_network_name = "vnet_rekha"
    location             = "centralindia"
    resource_group_name  = "rg01"
    nic_name             = "nic-frontend-vm"
  }

  vm2 = {
    VM_name              = "backend-vm"
    subnet_name          = "subnet_rekha2"
    virtual_network_name = "vnet_rekha"
    location             = "centralindia"
    resource_group_name  = "rg01"
    nic_name             = "nic-backend-vm"
  }
}

mysqlserver = {

  sq1 = {
    # =========================
    # SQL SERVER
    # =========================
    name                = "dev-sql-server231225"
    resource_group_name = "rg01"
    location            = "centralindia"
    version             = "12.0"

    administrator_login          = "sqladminuser"
    administrator_login_password = "StrongP@ssw0rd!"

    minimum_tls_version                      = "1.2"
    public_network_access_enabled            = true
    outbound_network_restriction_enabled     = false
    connection_policy                        = "Default"
    express_vulnerability_assessment_enabled = false

    # =========================
    # DATABASE
    # =========================
    db_name     = "devdb"
    db_sku_name = "S0"

    db_tags = {
      environment = "dev"
      app         = "backend"
    }

    # =========================
    # TAGS
    # =========================
    tags = {
      environment = "dev"
      owner       = "db-team"
    }
  }
}