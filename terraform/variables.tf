
variable "TENANT_ID" {
  type        = string
  description = "Azure Tenant id"
}

variable "SUBSCRIPTION_ID" {
  type        = string
  description = "Azure Subscription id"
}

variable "CLIENT_ID" {
  type        = string
  description = "Azure AppId"
}

variable "CLIENT_SECRET" {
  type        = string
  description = "Azure Client Secret"
}

variable "environment" {
  type        = string
  description = "Environment (dev / stage / prod)"
}

variable "uuid" {
  type        = string
  description = "UUID for resources created by terraform"
}

variable "resource_group_location" {
  type        = string
  description = "Resource group location"
}