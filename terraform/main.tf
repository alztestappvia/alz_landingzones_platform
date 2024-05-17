locals {
  #ukwest_virtual_hub_id = data.terraform_remote_state.core.outputs.azurerm_virtual_hub_ids["ukwest"]
  uksouth_virtual_hub_id = data.terraform_remote_state.core.outputs.azurerm_virtual_hub_ids["uksouth"]
  subscription_ids = {
    identity     = data.terraform_remote_state.core.outputs.subscription_identity
    connectivity = data.terraform_remote_state.core.outputs.subscription_connectivity
    management   = data.terraform_remote_state.core.outputs.subscription_management
  }
}

module "devops-agents" {
  # tflint-ignore: terraform_module_pinned_source
  source = "git::https://github.com/alztestappvia/alz_tfmod_landingzones?ref=main"

  providers = {
    azurerm = azurerm
    azuread = azuread
    azapi   = azapi
    time    = time
  }

  platform_environment = var.platform_environment
  app_environment      = var.app_environment
  subscription_ids     = local.subscription_ids
  billing_scope        = var.billing_scope

  virtual_networks = {
    main = {
      azurerm_virtual_hub_id = local.uksouth_virtual_hub_id
      address_space = {
        dev = ["172.28.4.128/28", "172.28.4.0/25"]
        prd = ["172.28.4.128/28", "172.28.4.0/25"] # different tenants - same cidr
      }
      dns_servers = ["172.28.0.132", "172.28.128.132"]
    }
  }

  state_uses_private_endpoint = lower(var.bootstrap_mode) != "true"

  directory_roles = [
    "Application Administrator"
  ]

  rbac = {
    template_name = "standard"
    create_groups = true
  }

  devops_project_name = "##DEVOPS_PROJECT_NAME##"
  management_group    = "internal"
  subscription_name   = "devops-agents"
  subscription_tags = {
    WorkloadName        = "ADO.AgentPools"
    DataClassification  = "General"
    BusinessCriticality = "Mission-critical"
    BusinessUnit        = "Platform Operations"
    OperationsTeam      = "Platform Operations"
  }
}
