resource "azurerm_network_interface" "ansible_nic" {
  name                = "ansible-nic"
  location            = azurerm_resource_group.ansible_rg.location
  resource_group_name = azurerm_resource_group.ansible_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ansible_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
  }
}

#az vm list-skus --location eastus --size Standard_B --all --output table
resource "azurerm_linux_virtual_machine" "ansible_vm" {
  name                = "ansible-machine"
  resource_group_name = azurerm_resource_group.ansible_rg.name
  location            = azurerm_resource_group.ansible_rg.location
  size                = "Standard_B2pts_v2"
  disable_password_authentication = false
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  network_interface_ids = [azurerm_network_interface.ansible_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

#az vm image list --location eastus --publisher Canonical
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-arm64"
    version   = "latest"
  }
}