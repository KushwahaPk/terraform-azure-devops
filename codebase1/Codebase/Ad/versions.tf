terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.106.1"
    }
  }
}

provider "azurerm" {
  client_id = "4ccb872e-0ff3-4fa0-baaa-8c8cb1585737"
  client_secret = "3IG8Q~NAZW7lqXnghJu3knc2vi9Xqf5SUlGfOa0a"
  tenant_id = "bf0c0a0b-3c7f-4283-b18d-fe25ad59d6be"
  subscription_id = "b0070e68-b200-4ae2-a2b4-09bd5ffaa6dc"
  features {}
}