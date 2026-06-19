variable "nsg_association_to_subnet" {
  type = map(object({
    subnet_name                 = string
    virtual_network_name        = string
    resource_group_name         = string
    network_security_group_name = string
  }))
}
