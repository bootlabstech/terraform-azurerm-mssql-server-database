# Creates a  MsSQL Server
resource "azurerm_mssql_server" "example" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  connection_policy            = var.connection_policy
  public_network_access_enabled = var.public_network_access_enabled
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}
# Creates a mssql database
resource "azurerm_mssql_database" "test" {
  name                           = var.name
  server_id                      = azurerm_mssql_server.example.id
  create_mode                    = var.create_mode
  geo_backup_enabled             = var.geo_backup_enabled
  maintenance_configuration_name = var.maintenance_configuration_name
  max_size_gb                    = var.max_size_gb
  sku_name                       = var.sku_name
  storage_account_type           = var.storage_account_type
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}