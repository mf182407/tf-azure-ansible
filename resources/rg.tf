resource "azurerm_resource_group" "ansible_rg" {
  provider = azurerm
  name     = "ansible"
  location = "East US"
}