variable "keyvaults" {
  description = "Map of keyvaults to create"
  type        = map(object({
    name                = string
    resource_group_name = string
    location            = string
  }))
}