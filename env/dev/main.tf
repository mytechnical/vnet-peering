module "resource_group" {
  source         = "../../module/azurerm_resource_group"
  resource_group = var.resource_group
}
module "virtual_network" {
  depends_on      = [module.resource_group]
  source          = "../../module/azurerem_virtual_network"
  virtual_network = var.virtual_network
}

module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../module/azurerm_subnet"
  subnet     = var.subnet
}

module "virtual_machine" {
  depends_on = [module.resource_group, module.virtual_network, module.subnet]
  source     = "../../module/azurerm_virtual_machine"
  vms        = var.vms
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azurerm_public_ip_address"
  public_ip  = var.public_ip
}

module "bastion_host" {
  depends_on = [module.resource_group, module.virtual_network, module.subnet]
  source     = "../../module/azurerm_azure_bastion"
  bastion    = var.bastion

}
module "nsg" {
    depends_on = [ module.resource_group ]
  source = "../../module/azurerm_network_security_group"
  network_security_group = var.network_security_group
}

module "nsg_association_to_subnet" {
    depends_on = [ module.resource_group,module.virtual_network,module.subnet,module.nsg ]
  source = "../../module/azurerm_subnet_network_security_group_association"
  nsg_association_to_subnet = var.nsg_association_to_subnet

}

module "peering" {
  depends_on = [ module.resource_group,module.virtual_network]
  source = "../../module/azurerm_vnet_peering"
  vnet_peering = var.vnet_peering
  
}