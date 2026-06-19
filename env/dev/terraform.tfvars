resource_group = {
  rg1 = {
    resource_group_name = "rg-dev"
    location            = "west europe"
  }
}

virtual_network = {
  vnet1 = {
    virtual_network_name = "vnet-dev"
    location             = "west europe"
    resource_group_name  = "rg-dev"
    address_space        = ["10.0.0.0/16"]
  }
  vnet2 = {
    virtual_network_name = "vnet-dev-bastion"
    location             = "west europe"
    resource_group_name  = "rg-dev"
    address_space        = ["10.0.0.0/24"]
  }
}

subnet = {
  S1 = {
    subnet_name          = "Frontend_subnet_dev"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.1.0/16"]
  }
  S2 = {
    subnet_name          = "Backend_subnet_dev"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.2.0/16"]
  }
  bastion_subnet = {
    subnet_name          = "bastion_subnet_dev"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev"
    address_prefixes     = ["10.0.3.0/16"]
  }
  S3 = {
    subnet_name          = "Frontend_bastion_subnet_dev"
    resource_group_name  = "rg-dev"
    virtual_network_name = "vnet-dev-bastion"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

vms = {
  vm1 = {
    nic_name                        = "Frontend_nic"
    location                        = "west europe"
    resource_group_name             = "rg-dev"
    virtual_network_name            = "vnet-dev"
    subnet_name                     = "Frontend_subnet_dev"
    vm_name                         = "Frontend_vm"
    size                            = "Standard_F2"
    admin_username                  = "devopsinsider"
    admin_password                  = "P@ssword"
    disable_password_authentication = "false"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
  vm2 = {
    nic_name                        = "Backend_nic"
    location                        = "west europe"
    resource_group_name             = "rg-dev"
    virtual_network_name            = "vnet-dev"
    subnet_name                     = "Backend_subnet_dev"
    vm_name                         = "backend-vm"
    size                            = "Standard_F2"
    admin_username                  = "devopsinsider"
    admin_password                  = "P@ssword"
    disable_password_authentication = "false"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
  vm3 = {
    nic_name                        = "Frontend_nic_bastion"
    location                        = "west europe"
    resource_group_name             = "rg-dev"
    virtual_network_name            = "vnet-dev-bastion"
    subnet_name                     = "Frontend_bastion_subnet_dev"
    vm_name                         = "Backend-vmF"
    size                            = "Standard_F2"
    admin_username                  = "devopsinsider"
    admin_password                  = "P@ssword"
    disable_password_authentication = "false"
    caching                         = "ReadWrite"
    storage_account_type            = "Standard_LRS"
    publisher                       = "Canonical"
    offer                           = "0001-com-ubuntu-server-jammy"
    sku                             = "22_04-lts"
    version                         = "latest"
  }
}

public_ip = {
  pip1 = {
    public_ip_name      = "pip_bastion"
    location            = "west europe"
    resource_group_name = "rg-dev"
  }
}

bastion = {
  bastion_1 = {
    bastion_host_name    = "bastion-dev"
    location             = "west europe"
    resource_group_name  = "rg-dev"
    subnet_name          = "bastion_subnet_dev"
    virtual_network_name = "vnet-dev"
    public_ip_name       = "pip_bastion"
  }
}

network_security_group = {
  nsg1 = {
    network_security_group_name = "nsg-dev"
    location                    = "west europe"
    resource_group_name         = "rg-dev"
    security_rule_name          = "allow nginx"
    tags = {
      environment = "Dev"
    }

  }
}
nsg_association_to_subnet = {
  nsg-attched-to-frontend = {
    subnet_name                 = "Frontend_subnet_dev"
    virtual_network_name        = "vnet-dev"
    resource_group_name         = "rg-dev"
    network_security_group_name = "nsg-dev"
  }

  nsg-attched-to-backend = {
    subnet_name                 = "Backend_subnet_dev"
    virtual_network_name        = "vnet-dev"
    resource_group_name         = "rg-dev"
    network_security_group_name = "nsg-dev"
  }
  nsg-atatched-to-bastion-vm = {
    subnet_name                 = "Frontend_bastion_subnet_dev"
    virtual_network_name        = "vnet-dev-bastion"
    resource_group_name         = "rg-dev"
    network_security_group_name = "nsg-dev"
  }
}

vnet_peering = {
  peering = {
    peering_vnet1_to_vnet2 = "vnet1-to-vnet2"
    peering_vnet2_to_vnet1 = "vnet2-to-vnet1"
    resource_group_name    = "rg-dev"
    vnet1_name             = "vnet-dev"
    vnet2_name             = "vnet-dev-bastion"
  }
}

