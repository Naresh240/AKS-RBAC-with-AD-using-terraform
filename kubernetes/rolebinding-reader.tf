resource "kubernetes_role_binding" "read_rolebinding" {
  metadata {
    name = "read-rolebinding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"   
    name      = "read-role"
  }
  subject {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Group"
    name      = var.kubernetes_read_group_object_ids
  }
}