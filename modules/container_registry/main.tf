resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = var.resource_group_name
  sku                 = "Premium"
  admin_enabled       = true 

  georeplications {
    location                = var.georeplication_location
    zone_redundancy_enabled = true
    tags                    = {}
  }
}

