config {
  module = true
  force = false
  disabled_by_default = false
}

plugin "azurerm" {
    enabled = true
    version = "0.20.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

rule "terraform_comment_syntax" {
  #This rule enforces comments with # instead of //
  enabled = true
}

rule "terraform_required_providers" {
  #This rule enforces required providers in terraform block
  enabled = true
}

rule "terraform_unused_required_providers" {
    #This rule enforces required providers in terraform block are all used
  enabled = true
}

rule "terraform_unused_declarations" {
    # This rule will look for unused variables and data sources
    enabled = true
}

rule "terraform_documented_variables" {
    # This rule ensures variables have a description
    enabled = true
}

rule "terraform_typed_variables" {
  # This rule enforces that every variable has to have a type
  enabled = true
}

rule "terraform_standard_module_structure" {
    # This rule enforces that every module has  a main.tf, variables.tf, and outputs.tf file. Variable and output blocks should be included in the corresponding file.
    enabled = true
}

rule "terraform_required_version" {
  # This rule enforces this block in every module:
  # terraform {
  #   required_providers {
  #     aws = ">= 2.7.0"
  #   }
  # }
  enabled = true
}