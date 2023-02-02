terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azurecaf = {
      source = "aztfmod/azurecaf"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.33.0"
    }    
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azurecaf" {
  # Configuration options
}

## replace the below with the correct values before running the code
provider "azuread" {
  client_id     = "<application_client_id>"
  client_secret = "<application_secret_value>"
  tenant_id     = "<tenant_id>"
}