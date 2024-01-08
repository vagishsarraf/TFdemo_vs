resource "azuread_application" "aks-demo" {
    display_name = "aks-demo"
}

resource "azuread_service_principal" "aks-demo" {
    # application_id = azuread_application.aks-demo.application_id
    client_id = azuread_application.aks-demo.client_id
}

resource "azuread_service_principal_password" "aks-demo" {
  service_principal_id = azuread_service_principal.aks-demo.id
}

output "service_principal_password" {
  value = azuread_service_principal_password.aks-demo.value
  sensitive = true
}