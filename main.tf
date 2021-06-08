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
  tenant_id       = var.TENANT_ID
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.resource_group_location
}

resource "azurerm_cosmosdb_account" "acc" {
  name                = var.cosmos_db_account_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    location          = var.resource_group_location
    failover_priority = 0
  }
}
