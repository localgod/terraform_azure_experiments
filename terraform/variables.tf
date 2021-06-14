
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
  description = "Azure AppId"
}

variable "CLIENT_SECRET" {
  type = string
  description = "Azure Client Secrect"
}

variable "ENVIRONMENT" {
  type = string
  description = "Environment (dev / stage / prod)"
}

variable "project" {
  type = string
  description = "Project name"
}

variable "uuid" {
  type = string
  description = "an4d6zgufraq6egi6ank"
}

variable "resource_group_location" {
  type    = string
  description = "Resource group location"
}