variable "vms" {
  type = map(object({
    nic_name                        = string
    location                        = string
    resource_group_name             = string
    subnet_name                     = string
    virtual_network_name            = string
    vm_name                         = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    disable_password_authentication = string
    caching                         = string
    storage_account_type            = string
    publisher                       = string
    offer                           = string
    sku                             = string
    version                         = string
  }))
}
