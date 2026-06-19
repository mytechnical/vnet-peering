

resource "azurerm_subnet_network_security_group_association" "subnet-nsg-association" {
  for_each                  = var.nsg_association_to_subnet
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.security_group[each.key].id
}

