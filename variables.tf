variable "container_registry_name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "georeplication_location" {
  type        = string
  description = "Location for geo-replication"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
}
