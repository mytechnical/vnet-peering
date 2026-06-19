variable "vnet_peering" {
  type = map(object({
    peering_vnet1_to_vnet2 = string
    peering_vnet2_to_vnet1 = string
    resource_group_name    = string
    vnet1_name             = string
    vnet2_name             = string
  }))
}
