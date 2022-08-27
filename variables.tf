variable "clientid" {
  description = "contains the Client Id for service principal"
  default   = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

variable "clientsecret" {
  description = "contains the Client Secret for service principal"
  default   = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX""
}

variable "tenantid" {
  description = "contains the Tenant Id for service principal"
  default   = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}
variable "subscriptionid" {
  description = "contains the Subscription Id for service principal"
  default   = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

variable "resource_group_name" {
  description = "contains the name of the Resource Group"
  default     = "azdevops"
}

# Resource Group variables

variable "resource_group_location" {
  description = "contains the location of Resource Group"
  default     = "northeurope"
}

# AKS cluster variables

variable "cluster_name" {
  description = "This Contains the name of Azure Container Registry"
  default     = "aksdemo"
}

variable "rbac_aad_admin_group_object_ids" {
  type        = list(string)
  description = "This Contains the name of Azure Container Registry"
  default     = ["b2a27b2f-f45d-4f3a-82e9-07ec2daeed74"]
}

# kubernetes variables
variable "kubernetes_admin_group_object_ids" {
  type        = string
  description = "This Contains the name of Azure Container Registry"
  default     = "b2a27b2f-f45d-4f3a-82e9-07ec2daeed74"
}

variable "kubernetes_read_group_object_ids" {
  type        = string
  description = "This Contains the name of Azure Container Registry"
  default     = "98378835-11ba-4dcd-b41b-abb6a62d65b5"
}

# Default nodepool variables

variable "default_node_pool_count" {
  type = number
  description = "This Contains the name of Azure Container Registry"
  default     = 1
}

variable "default_node_pool_name" {
  type = string
  description = "This Contains the name of Azure Container Registry"
  default     = "defaultnp"
}

variable "default_node_pool_VM_size" {
  type = string
  description = "This Contains the name of Azure Container Registry"
  default     = "Standard_D2a_v4"
}