terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg01"            # RG jisme storage account bana hai
    storage_account_name = "priyanshsg"  # Storage account ka naam
    container_name       = "fortfstate"   # Container jisme state file hogi
    key                  = "terraform.tfstate" # State file ka naam
  }
}

provider "azurerm" {
  features {}
  subscription_id = "eac08841-5119-4501-b5ac-82e7a5d29114"
}