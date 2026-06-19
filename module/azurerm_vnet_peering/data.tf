data "azurerm_virtual_network" "vnet_2" {
  for_each            = var.vnet_peering
  name                = each.value.vnet2_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_virtual_network" "vnet_1" {
  for_each            = var.vnet_peering
  name                = each.value.vnet1_name
  resource_group_name = each.value.resource_group_name
}