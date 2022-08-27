variable "resource_group_name" {
  type = string
  description = "contains the name of the Resource Group"
}

variable "resource_group_location" {
  type = string
  description = "contains the location of Resource Group"
}

variable "cluster_name" {
  type = string
  description = "This Contains the name of Azure Container Registry"
}

variable "rbac_aad_admin_group_object_ids" {
  type = list(string)
  description = "This Contains the name of Azure Container Registry"
}

# Default nodepool variables

variable "default_node_pool_count" {
  type = number
  description = "This Contains the name of Azure Container Registry"
}

variable "default_node_pool_name" {
  type = string
  description = "This Contains the name of Azure Container Registry"
}

variable "default_node_pool_VM_size" {
  type = string
  description = "This Contains the name of Azure Container Registry"
}