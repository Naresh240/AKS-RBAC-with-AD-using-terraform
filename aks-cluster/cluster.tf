resource"azurerm_kubernetes_cluster" "testcluster"{
  name  = "${var.cluster_name}"
  location  = "${var.resource_group_location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_prefix  = "${var.cluster_name}"
  role_based_access_control_enabled = true

  default_node_pool {
    # Defining details for the 
    name  = "defaultnp"
    node_count  = 1
    vm_size = "Standard_D2a_v4"
  }

  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = ["b2a27b2f-f45d-4f3a-82e9-07ec2daeed74"]
    azure_rbac_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    environment = "azureterraform"
    cluster_name  = "${var.cluster_name}"
  }
}