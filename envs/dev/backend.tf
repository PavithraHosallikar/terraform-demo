terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-demo"
    storage_account_name = "tfstatepavithra2024"
    container_name      = "terraform-state"
    key                 = "dev.terraform.tfstate"
  }
}
