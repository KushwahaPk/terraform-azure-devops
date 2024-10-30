module "keyvaults" {
  source = "./modules/keyvault"
  keyvaults = local.keyvaults
}

resource "azurerm_resource_group" "rg1" {
  name = "kvtest-rg"
  location = "East US"
}