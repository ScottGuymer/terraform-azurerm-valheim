resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.region
}
resource "azurerm_container_group" "valheim" {
  name                = "valheim-server"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "public"
  dns_name_label      = var.hostname
  os_type             = "Linux"

  container {
    name   = "valheim-server"
    image  = var.valheim_server_image
    cpu    = "2"
    memory = "5"

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
    volume {
      name                 = "config"
      mount_path           = "/config"
      share_name           = azurerm_storage_share.config.name
      storage_account_name = azurerm_storage_account.valheim.name
      storage_account_key  = azurerm_storage_account.valheim.primary_access_key
    }
    volume {
      name                 = "data"
      mount_path           = "/opt/valheim"
      share_name           = azurerm_storage_share.data.name
      storage_account_name = azurerm_storage_account.valheim.name
      storage_account_key  = azurerm_storage_account.valheim.primary_access_key
    }
    environment_variables = merge({
      SERVER_NAME   = var.server_name
      SERVER_PASS   = var.server_password
      WORLD_NAME    = var.world_name
      ADMINLIST_IDS = join(" ", var.adminlist_ids)
    }, var.environment_variables)
  }
}