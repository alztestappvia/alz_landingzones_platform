data "terraform_remote_state" "core" {
  backend = "azurerm"

  config = {
    use_azuread_auth     = true
    use_oidc             = var.use_oidc
    storage_account_name = var.core_storage_account_name
    container_name       = "tfstate"
    key                  = "core.tfstate"
  }
}
