
# Creates a  MsSQL Server
resource "azurerm_mssql_server" "example" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.administrator_login
  administrator_login_password = random_password.password.result
  connection_policy            = var.connection_policy
  public_network_access_enabled = var.public_network_access_enabled
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}


# get key vault details to store DB password as secret
data "azurerm_key_vault" "key_vault" {
  name                = var.keyvault_name
  resource_group_name = var.resource_group_name
}

# Creates random password
resource "random_password" "password" {
  length      = 12
  lower       = true
  min_lower   = 6
  min_numeric = 2
  min_special = 2
  min_upper   = 2
  numeric     = true
  special     = true
  upper       = true

}

# Stores DB login password as keyvault secret
resource "azurerm_key_vault_secret" "mssql_password" {
  name         = "${var.name}-pwd"
  value        = random_password.password.result
  key_vault_id = data.azurerm_key_vault.key_vault.id

  depends_on = [azurerm_mssql_server.example]
}  
# Creates  a private endpoint with private dns
resource "azurerm_private_endpoint" "endpoint" {
  name                = "${var.name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = "${var.name}-connection"
    private_connection_resource_id = azurerm_mssql_server.example.id
    is_manual_connection           = var.is_manual_connection
    subresource_names              = var.subresource_names

  }

  private_dns_zone_group {
    name                 = "${var.name}-dnszone"
    private_dns_zone_ids = var.private_dns_zone_ids
  }
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
  depends_on = [ azurerm_mssql_server.example ]

}
# Creates a mssql database
resource "azurerm_mssql_database" "test" {
  name                           = var.dbname
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

  depends_on = [ azurerm_mssql_server.example ]
}