locals {
  keyvaults = {
   kv1 = {
    name = "kvtesttttt-01"
    location = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    object_id = "d68e57de-7952-4e42-9da4-48441abdf8eb"
   },
   kv2 = {
    name = "kvtesttttt-02"
    location = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
   }
  }
}