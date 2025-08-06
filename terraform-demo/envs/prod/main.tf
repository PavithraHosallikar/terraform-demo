terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_resource_group" "demo" {
  name     = "rg-demo-${var.environment}-${random_string.suffix.result}"
  location = var.location
  
  tags = {
    Environment = var.environment
    Project     = "terraform-demo"
    CreatedBy   = "GitHub Actions"
    Branch      = "prod"
  }
}

resource "azurerm_storage_account" "demo" {
  name                     = "st${var.environment}${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = {
    Environment = var.environment
    Project     = "terraform-demo"
    CreatedBy   = "GitHub Actions"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.demo.name
}

output "resource_group_location" {
  value = azurerm_resource_group.demo.location
}

output "storage_account_name" {
  value = azurerm_storage_account.demo.name
}