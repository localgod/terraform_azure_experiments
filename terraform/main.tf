terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.63.0"
    }
  }
  backend "remote" {
    organization = "mathmagicians"

    workspaces {
      #name = "terraform_azure_experiments" #var.ENVIRONMENT
      name = "${var.project}-${var.ENVIRONMENT}"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.SUBSCRIPTION_ID
  client_id       = var.CLIENT_ID
  client_secret   = var.CLIENT_SECRET
  tenant_id       = var.TENANT_ID
}

resource "azurerm_resource_group" "rg" {
  name     = "resource-group-${var.uuid}"
  location = var.resource_group_location
  tags = {
    environment = var.ENVIRONMENT
  }
}

resource "azurerm_storage_account" "sa" {
  name                     = var.uuid
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = var.ENVIRONMENT
  }
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "service-plan-${var.uuid}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "B1"
  }
  tags = {
    environment = var.ENVIRONMENT
  }
}

resource "azurerm_app_service" "apps" {
  name                = "app-service-${var.uuid}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  tags = {
    environment = var.ENVIRONMENT
  }
}

resource "azurerm_application_insights" "application_insights" {
  name                = "application-insights-${var.uuid}"
  location            = var.resource_group_location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "other"
  tags = {
    environment = var.ENVIRONMENT
  }
}

resource "azurerm_function_app" "function_app" {
  name                = "function-app-${var.uuid}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.resource_group_location
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"       = "",
    "FUNCTIONS_WORKER_RUNTIME"       = "dotnet",
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.application_insights.instrumentation_key,
  }
  os_type = "linux"
  site_config {
    linux_fx_version          = "DOTNETCORE|3.1"
    use_32_bit_worker_process = false
  }
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  version                    = "~3"

  lifecycle {
    ignore_changes = [
      app_settings["WEBSITE_RUN_FROM_PACKAGE"],
    ]
  }

  tags = {
    environment = var.ENVIRONMENT
  }
}

/*
resource "azurerm_relay_namespace" "rn" {
  name                = "rn-${var.uuid}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "Standard"
}

resource "azurerm_relay_hybrid_connection" "rhc" {
  name                 = "RHC1-${var.uuid}"
  resource_group_name  = azurerm_resource_group.rg.name
  relay_namespace_name = azurerm_relay_namespace.rn.name
  user_metadata        = "examplemetadata"
}

resource "azurerm_app_service_hybrid_connection" "example" {
  app_service_name    = azurerm_app_service.apps.name
  resource_group_name = azurerm_resource_group.rg.name
  relay_id            = azurerm_relay_hybrid_connection.rhc.id
  hostname            = "testhostname.example"
  port                = 8080
  send_key_name       = "exampleSharedAccessKey"
}
*/
