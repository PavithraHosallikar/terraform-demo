terraform {
  backend "azurerm" {
    resource_group_name  = "<TF_STATE_RG>"
    storage_account_name = "<TF_STATE_STORAGE>"
    container_name       = "<TF_STATE_CONTAINER>"
    key                  = "prod.terraform.tfstate"
  }
}
