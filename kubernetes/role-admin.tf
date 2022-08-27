resource "kubernetes_role" "admin_role" {
    metadata {
      name      = "admin-role"
    }
    rule {
    api_groups     = [""]
    resources      = ["*"]
    verbs          = ["*"]
  }
}