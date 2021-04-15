resource "random_string" "storagename" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_storage_account" "valheim" {
  name                     = "valheim${random_string.storagename.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_kind             = "FileStorage"
  account_tier             = "Premium"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "config" {
  name                 = "config"
  storage_account_name = azurerm_storage_account.valheim.name
  quota                = 100
}

resource "azurerm_storage_share" "data" {
  name                 = "data"
  storage_account_name = azurerm_storage_account.valheim.name
  quota                = 100
}