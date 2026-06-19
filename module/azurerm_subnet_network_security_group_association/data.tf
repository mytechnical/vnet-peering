data "azurerm_subnet" "subnet" {
  for_each             = var.nsg_association_to_subnet
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_network_security_group" "security_group" {
  for_each            = var.nsg_association_to_subnet
  name                = each.value.network_security_group_name
  resource_group_name = each.value.resource_group_name
}
