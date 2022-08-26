provider "azurerm" {
  features {}
  client_id = "${var.clientid}"
  client_secret = "${var.clientsecret}"
  tenant_id     = "${var.tenantid}"
  subscription_id = "${var.subscriptionid}"
}