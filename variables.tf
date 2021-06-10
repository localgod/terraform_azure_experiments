
variable "TENANT_ID" {
  type = string
  description = "Azure Tenant id"
}

variable "SUBSCRIPTION_ID" {
  type = string
  description = "Azure Subscription id"
}

variable "CLIENT_ID" {
  type = string
  description = "Azure Appid"
}

variable "CLIENT_SECRET" {
  type = string
  description = "Azure Client Secrect"
}

variable "project" {
  type = string
  description = "Project name"
}

variable "environment" {
  type = string
  description = "Environment (dev / stage / prod)"
}

variable "resource_group" {
  type    = string
  description = "Resource group"
}

variable "resource_group_location" {
  type    = string
  description = "Resource group location"
}

variable "cosmos_db_account_name" {
  type    = string
  description = "Cosmos Database account name"
}

variable "failover_location" {
  type    = string
  description = "Cosmos Database Failover location"
}