resource "kubernetes_role" "example_role" {
    metadata {
      name      = "pod-reader"
    }
    rule {
    api_groups     = [""]
    resources      = ["pods"]
    verbs          = ["get", "list", "watch"]
  }
}