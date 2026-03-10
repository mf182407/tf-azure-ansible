variable "vm_username" {
  description = "The username for the VM administrator account"
  type        = string
  default     = "admin"
}
variable "vm_password" {
  description = "The password for the VM administrator account"
  type        = string
  sensitive   = true
}