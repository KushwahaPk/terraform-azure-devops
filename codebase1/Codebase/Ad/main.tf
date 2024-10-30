resource "azuread_application" "app" {
  display_name = "example-01"
}

# resource "azurerm_resource_group" "rg" {
#   name = "Ad-demo"
#   location = "East US"
# }