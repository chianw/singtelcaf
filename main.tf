## creates a new role-assignable group and a new service principal, puts existing user and the new service principal as members of the new group and assigns a role to the group, then create an admin unit and put the group into the admin unit

data "azuread_client_config" "current" {}

data "azuread_user" "groupowner" {
  user_principal_name = "chris@greenbeansoup.onmicrosoft.com"
}

data "azuread_user" "groupmember1" {
  user_principal_name = "james@greenbeansoup.onmicrosoft.com"
}


resource "azuread_application" "example-app" {
  display_name = "example-app"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_password" "example-app-secret" {
  application_object_id = azuread_application.example-app.object_id
}

resource "azuread_service_principal" "example-app" {
  application_id               = azuread_application.example-app.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_group" "examplegroup" {
  display_name     = "examplegroup"
  owners           = [data.azuread_user.groupowner.object_id]
  security_enabled = true
  assignable_to_role = true
  members = [data.azuread_user.groupmember1.object_id,azuread_service_principal.example-app.object_id]
}

resource "azuread_directory_role" "example-builtinrole" {
  display_name = "Security Administrator"
}

resource "azuread_directory_role_assignment" "example-roleassignment" {
  role_id             = azuread_directory_role.example-builtinrole.template_id
  principal_object_id = resource.azuread_group.examplegroup.object_id
}

resource "azuread_administrative_unit" "example_adminunit" {
  display_name = "example-adminunit"
  description  = "Example admin unit"
  members = [resource.azuread_group.examplegroup.object_id]
}

