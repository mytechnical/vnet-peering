resource "azurerm_virtual_network_peering" "vnet1_to_vnet2" {
  for_each                     = var.vnet_peering
  name                         = each.value.peering_vnet1_to_vnet2
  resource_group_name          = each.value.resource_group_name
  virtual_network_name         = each.value.vnet1_name
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet_2[each.key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "vnet2_to_vnet1" {
  for_each                  = var.vnet_peering
  name                      = each.value.peering_vnet2_to_vnet1
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.vnet2_name
  remote_virtual_network_id = data.azurerm_virtual_network.vnet_1[each.key].id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}


