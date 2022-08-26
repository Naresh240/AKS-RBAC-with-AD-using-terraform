resource "kubernetes_role_binding" "example_rolebinding" {
  metadata {
    name = "terraform-example"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"   
    name      = "pod-reader"
  }
  subject {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Group"
    name      = "b2a27b2f-f45d-4f3a-82e9-07ec2daeed74"
  }
}