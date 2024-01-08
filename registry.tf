resource "random_string" "random-name" {
  length = 8
  upper = false
  lower = false
  numeric = true
  special = false
}

resource "azurerm_container_registry" "name" {
  name = "demoapp${random_string.random-name.result}"
  resource_group_name = azurerm_resource_group.demo.name
  location = var.location
  sku = "Standard"
  admin_enabled = false
}
