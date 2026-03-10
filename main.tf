module "resources" {
  source = "./resources"

  vm_username = var.vm_username
  vm_password = var.vm_password
}