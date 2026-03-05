resource "azurerm_resource_group" "ansible" {
  provider = azurerm
  name     = "ansible"
  location = "East US"
}