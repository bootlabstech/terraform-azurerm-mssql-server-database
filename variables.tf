# server
variable "server_name" {
  type        = string
  description = "value"

}
variable "resource_group_name" {
  type        = string
  description = "value"

}
variable "location" {
  type        = string
  description = "value"

}
variable "server_version" {
  type        = string
  description = "value"
  default     = "12.0"

}
variable "administrator_login" {
  type        = string
  description = "value"

}
# variable "administrator_login_password" {
#   type        = string
#   description = "value"


# }
variable "connection_policy" {
  type        = string
  description = "value"
  default     = "Default"

}
variable "create_mode" {
  type        = string
  description = "value"
  default     = "Default"


}
variable "geo_backup_enabled" {
  type        = bool
  description = "value"
  default     = true

}
variable "maintenance_configuration_name" {
  type        = string
  description = "value"
  default     = "SQL_Default"

}
variable "max_size_gb" {
  type        = number
  description = "value"

}
variable "sku_name" {
  type        = string
  description = "value"

}
variable "storage_account_type" {
  type        = string
  description = "value"
  default     = "Geo"

}
# database
variable "name" {
    type = string
    description = "value"

}
variable "public_network_access_enabled" {
    type = bool
    description = "value"
    default = false

}
variable "keyvault_name" {
 type        = string
  
}