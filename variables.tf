
variable "TENANT_ID" {
  type = string
}

variable "SUBSCRIPTION_ID" {
  type = string
}

variable "CLIENT_ID" {
  type = string
}

variable "CLIENT_SECRET" {
  type = string
}

variable "resource_group" {
  type    = string
  default = "ahriman_main"
}

variable "resource_group_location" {
  type    = string
  default = "northeurope"
}

variable "cosmos_db_account_name" {
  type    = string
  default = "ahriman-cosmo"
}

variable "failover_location" {
  type    = string
  default = "westeurope"
}