resource"azurerm_kubernetes_cluster" "testcluster"{
  name  = "${var.cluster_name}"
  location  = "${var.resource_group_location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_prefix  = "${var.cluster_name}"
  role_based_access_control_enabled = true

  default_node_pool {
    # Defining details for the 
    name  = var.default_node_pool_name
    node_count  = var.default_node_pool_count
    vm_size = var.default_node_pool_VM_size
  }

  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = var.rbac_aad_admin_group_object_ids
    azure_rbac_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    environment = "dev"
    cluster_name  = "${var.cluster_name}"
  }
}