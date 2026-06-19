variable "resource_group" {
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "virtual_network" {
  type = map(object({
    virtual_network_name = string
    location             = string
    resource_group_name  = string
    address_space        = list(string)
  }))
}

variable "subnet" {
  type = map(object({
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)

  }))
}

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

variable "public_ip" {
  type=map(object({
    public_ip_name=string
    location=string
    resource_group_name=string
  }))
}

variable "bastion" {
  type = map(object({
    bastion_host_name    = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    public_ip_name       = string

  }))

}
variable "network_security_group" {
  type = map(object({
    network_security_group_name = string
    location                    = string
    resource_group_name         = string
    security_rule_name          = string
    tags                        = map(string)
  }))

}
variable "nsg_association_to_subnet" {
  type = map(object({
    subnet_name                 = string
    virtual_network_name        = string
    resource_group_name         = string
    network_security_group_name = string
  }))
}

variable "vnet_peering" {
  type = map(object({
    peering_vnet1_to_vnet2 = string
    peering_vnet2_to_vnet1 = string
    resource_group_name    = string
    vnet1_name             = string
    vnet2_name             = string
  }))
}