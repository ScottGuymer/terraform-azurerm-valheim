resource "azurerm_resource_group" "rg" {
  name     = "valheim"
  location = "westeurope"
}

resource "random_string" "storagename" {
  length           = 8
  special          = false 
  upper = false 
}

resource "azurerm_storage_account" "valheim" {
  name                     = "valheim${random_string.storagename.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_share" "config" {
  name                 = "config"
  storage_account_name = azurerm_storage_account.valheim.name
  quota                = 50
}

resource "azurerm_storage_share" "data" {
  name                 = "data"
  storage_account_name = azurerm_storage_account.valheim.name
  quota                = 50
}

resource "azurerm_container_group" "valheim" {
  name                = "valheim-server"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "public"
  dns_name_label      = var.dns_host
  os_type             = "Linux"

  container {
    name   = "valheim-server"
    image  = "lloesche/valheim-server"
    cpu    = "4"
    memory = "8"

    ports {
      port     = 2456
      protocol = "UDP"
    }
    ports {
      port     = 2457
      protocol = "UDP"
    }
    ports {
      port     = 2458
      protocol = "UDP"
    }
    # ports {
    #   port     = 2456
    #   protocol = "TCP"
    # }
    # ports {
    #   port     = 2457
    #   protocol = "TCP"
    # }
    # ports {
    #   port     = 2458
    #   protocol = "TCP"
    # }
    volume {
      name                 = "config"
      mount_path           = "/config"
      share_name = azurerm_storage_share.config.name
      storage_account_name = azurerm_storage_account.valheim.name
      storage_account_key  = azurerm_storage_account.valheim.primary_access_key
    }
    volume {
      name                 = "data"
      mount_path           = "/opt/valheim"
      share_name = azurerm_storage_share.data.name
      storage_account_name = azurerm_storage_account.valheim.name
      storage_account_key  = azurerm_storage_account.valheim.primary_access_key
    }
    environment_variables = {
      SERVER_NAME = var.server_name
      SERVER_PASS = var.server_password
      WORLD_NAME  = var.world_name
    }
  }


}