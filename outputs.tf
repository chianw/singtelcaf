output "example-app-secret-keyid" {
  value = azuread_application_password.example-app-secret.key_id
  sensitive = true
}

output "example-app-secret-value" {
  value = azuread_application_password.example-app-secret.value
  sensitive = true
}
