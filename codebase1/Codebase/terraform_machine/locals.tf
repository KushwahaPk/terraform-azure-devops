
locals {
  virtual_machines = {
    example1 = {
      name                = "demo-vm1"
      resource_group_name = azurerm_resource_group.example.name
      location            = azurerm_resource_group.example.location
      vm_size             = "Standard_DS1_v2"
      admin_username      = "adminuser1"
      admin_password      = "Admin@0987654"
      lun  = 1
      disk_size_gb = 200
      network_interface_id = azurerm_network_interface.example1.id
    }
   /* example2 = {
      name                = "demo-vm2"
      resource_group_name = azurerm_resource_group.example.name
      location            = azurerm_resource_group.example.location
      vm_size             = "Standard_DS1_v2"
      admin_username      = "adminuser2"
      admin_password      = "Admin@0987654"
      lun  = 2
      disk_size_gb = 155
      network_interface_id = azurerm_network_interface.example2.id
    }
    # Add more VM configurations as needed
     */
  }
}



  