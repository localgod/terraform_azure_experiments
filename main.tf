terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.62.0"
    }
  }
  required_version = ">= 0.15.5"
}

provider "azurerm" {
  features {}
  subscription_id = var.SUBSCRIPTION_ID
  client_id       = var.CLIENT_ID
  client_secret   = var.CLIENT_SECRET
  tenant_id       = var.TENANT_ID
}

resource "azurerm_resource_group" "rg" {
  name = "${var.project}-${var.ENVIRONMENT}-resource-group"
  location = var.resource_group_location
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.project}serviceaccount"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

