terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }

  backend "remote" {
    organization = "azure-devops-infra"

    workspaces {
      name = "acr-infra"
    }
  }
}

provider "azurerm" {
  features {}
}


data "azurerm_resource_group" "acr_rg" {
  name     = var.resource_group_name
}

module "container_registry" {
  source = "./modules/container_registry"
  resource_group_name = data.azurerm_resource_group.acr_rg.name
  container_registry_name = var.container_registry_name
  georeplication_location = var.georeplication_location

}
