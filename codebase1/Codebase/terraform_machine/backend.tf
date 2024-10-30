terraform {
  backend "azurerm" {
    storage_account_name = "teststorage45678"
    container_name = "stfstatefile"
    key = "terraform.tfstate"
    resource_group_name  = "devops-test-rg"
    # subscription_id = "00000000-0000-0000-0000-000000000000"
    # client_id = "00000000-0000-0000-0000-000000000000"
    # client_secret = "mysecret"
    # tenant_id = "00000000-0000-0000-0000-000000000000"
  }
}