resource "kubernetes_role" "read_role" {
    metadata {
      name      = "read-role"
    }
    rule {
    api_groups     = [""]
    resources      = ["pods"]
    verbs          = ["get", "list", "watch"]
  }
}