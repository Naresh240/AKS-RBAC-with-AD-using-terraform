resource "kubernetes_role_binding" "admin_rolebinding" {
  metadata {
    name = "admin-rolebinding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"   
    name      = "admin-role"
  }
  subject {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Group"
    name      = var.kubernetes_admin_group_object_ids
  }
}