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


resource "azurerm_resource_group" "acr_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "container_registry" {
  source = "./modules/container_registry"
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
  container_registry_name = var.container_registry_name
  georeplication_location = var.georeplication_location

}
