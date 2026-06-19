resource "azurerm_network_security_group" "NSG" {
  for_each            = var.network_security_group
  name                = each.value.network_security_group_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = each.value.security_rule_name
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = each.value.tags

}
