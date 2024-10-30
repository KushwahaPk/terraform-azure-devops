variable "virtual_machines" {
  description = "Map of virtual machines to create"
  type        = map(object({
    name                = string
    resource_group_name = string
    location            = string
    vm_size             = string
    admin_username      = string
    admin_password      = string
    network_interface_id = string
    lun = string
    disk_size_gb = string
  }))
}
