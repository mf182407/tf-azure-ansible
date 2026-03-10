resource "azurerm_network_interface" "ansible_nic" {
  name                = "ansible-nic"
  location            = azurerm_resource_group.ansible_rg.location
  resource_group_name = azurerm_resource_group.ansible_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ansible_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.2.10"
  }
}

resource "azurerm_linux_virtual_machine" "ansible_vm" {
  name                = "ansible-machine"
  resource_group_name = azurerm_resource_group.ansible_rg.name
  location            = azurerm_resource_group.ansible_rg.location
  size                = "Standard_B1s"
  admin_username      = "admin"
  network_interface_ids = [azurerm_network_interface.ansible_nic.id]

  admin_ssh_key {
    username   = "admin"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "24.04-LTS"
    version   = "latest"
  }
}