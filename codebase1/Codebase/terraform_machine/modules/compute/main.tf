resource "azurerm_windows_virtual_machine" "example" {
  for_each = var.virtual_machines
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [
    each.value.network_interface_id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
resource "azurerm_managed_disk" "example" {
  for_each = var.virtual_machines
  name                 = "${each.value.name}-datadisk"
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = each.value.disk_size_gb
}
resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  depends_on = [
    azurerm_windows_virtual_machine.example
  ]
  for_each           = var.virtual_machines
  managed_disk_id    = azurerm_managed_disk.example[each.key].id
  virtual_machine_id = azurerm_windows_virtual_machine.example[each.key].id
  lun                = each.value.lun
  caching            = "ReadWrite"
}