# server
variable "server_name" {
  type        = string
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure. "

}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Microsoft SQL Server."

}
variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists.Central India or South India"

}
variable "server_version" {
  type        = string
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)."
  default     = "12.0"

}
variable "administrator_login" {
  type        = string
  description = "The administrator login name for the new server."

}
variable "connection_policy" {
  type        = string
  description = "The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  default     = "Default"

}
variable "public_network_access_enabled" {
    type = bool
    description = "Whether public network access is allowed for this server. Defaults to true."
    default = true

}

# MSSQL database
variable "name" {
    type = string
    description = "The name of the MS SQL Database. Changing this forces a new resource to be created."

}
variable "create_mode" {
  type        = string
  description = "The create mode of the database. Possible values are Copy, Default, OnlineSecondary, PointInTimeRestore, Recovery, Restore, RestoreExternalBackup, RestoreExternalBackupSecondary, RestoreLongTermRetentionBackup and Secondary. Mutually exclusive with import."
  default     = "Default"


}
variable "geo_backup_enabled" {
  type        = bool
  description = "A boolean that specifies if the Geo Backup Policy is enabled. Defaults to true."
  default     = true

}
variable "maintenance_configuration_name" {
  type        = string
  description = "The name of the Public Maintenance Configuration window to apply to the database. Valid values include SQL_Default"
  default     = "SQL_Default"

}
variable "max_size_gb" {
  type        = number
  description = "The max size of the database in gigabytes."

}
variable "sku_name" {
  type        = string
  description = "Specifies the name of the SKU used by the database. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."

}
variable "storage_account_type" {
  type        = string
  description = "Specifies the storage account type used to store backups for this database. Possible values are Geo, Local and Zone. The default value is Geo."
  default     = "Geo"


}
variable "keyvault_name" {
 type        = string
  
}
