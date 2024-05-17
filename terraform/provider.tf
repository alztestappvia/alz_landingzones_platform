provider "azurerm" {
  use_oidc            = var.use_oidc
  storage_use_azuread = true
  features {}
}

provider "azuread" {
  use_oidc = var.use_oidc
}

provider "azapi" {
  use_oidc = var.use_oidc
}

provider "azurecaf" {}

provider "azuredevops" {
  org_service_url       = "https://dev.azure.com/${var.devops_org_name}"
  personal_access_token = var.devops_pat
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}
