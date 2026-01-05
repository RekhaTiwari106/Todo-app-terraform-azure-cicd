terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg01"            # RG jisme storage account bana hai
    storage_account_name = "priyanshsg05012026"  # Storage account ka naam
    container_name       = "fortfstate"   # Container jisme state file hogi
    key                  = "terraform.tfstate" # State file ka naam
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6aa54bfd-6d64-4af4-b65a-f9a6b4ebcedf"
}