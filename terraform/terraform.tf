terraform {
  required_version = ">= 1.3.1"

  backend "azurerm" {
    use_azuread_auth = true
    use_oidc         = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.65.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.40.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.6.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = ">= 1.7.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = ">= 1.2.23"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.1"
    }
    github = {
      source  = "integrations/github"
      version = ">= 5.25.0"
    }
  }
}
