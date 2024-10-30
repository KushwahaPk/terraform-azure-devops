output "vm_ids" {
  description = "Map of VM IDs"
  value       = { for k, v in azurerm_windows_virtual_machine.example : k => v.id }
}
