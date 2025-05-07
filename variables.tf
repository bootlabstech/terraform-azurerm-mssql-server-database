# server
variable "name" {
  type        = string
  description = "The name of the Microsoft SQL Server. This needs to be globally unique within Azure. "

}
variable "server_name" {
  type        = string
  description = "value"
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

variable "keyvault_name" {
  type = string
  
}

# private endpoint

variable "private_endpoint_subnet_id" {
  type        = string
  description = "The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint."

}

variable "is_manual_connection" {
  type        = bool
  description = "Does the Private Endpoint require Manual Approval from the remote resource owner?"
  default     = false

}
variable "subresource_names" {
  type        = list(string)
  description = " A list of subresource names which the Private Endpoint is able to connect to."
  default = [ "sqlServer" ]
}
variable "private_dns_zone_ids" {
  type        = list(string)
  description = "Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
}

variable "ip_configuration" {
  type        = bool
  default     = false
  description = "One or more ip_configuration blocks as defined below. This allows a static IP address to be set for this Private Endpoint, otherwise an address is dynamically allocated from the Subnet."
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
variable "dbname" {
    type = string
    description = "value"

}
variable "public_network_access_enabled" {
    type = bool
    description = "value"
    default = false

}