terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.0.3"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.6.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.1.0"
    }
  }
}

data "azurerm_kubernetes_cluster" "default" {
  depends_on          = [module.aks-cluster] # refresh cluster state before reading
  name              = var.cluster_name
  resource_group_name = var.resource_group_name
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.default.kube_admin_config.0.host
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.default.kube_admin_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.default.kube_admin_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.default.kube_admin_config.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.default.kube_config.0.host
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.default.kube_admin_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.default.kube_admin_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.default.kube_admin_config.0.cluster_ca_certificate)
  }
}

module "aks-cluster" {
  source       = "./aks-cluster"
  cluster_name = var.cluster_name
  resource_group_name = var.resource_group_name
  resource_group_location = var.resource_group_location
  rbac_aad_admin_group_object_ids = var.rbac_aad_admin_group_object_ids
  default_node_pool_count = var.default_node_pool_count
  default_node_pool_name  = var.default_node_pool_name
  default_node_pool_VM_size = var.default_node_pool_VM_size
}

module "create-role" {
  source       = "./kubernetes"
  kubernetes_admin_group_object_ids = var.kubernetes_admin_group_object_ids
  kubernetes_read_group_object_ids = var.kubernetes_read_group_object_ids
}