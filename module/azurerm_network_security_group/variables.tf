variable "network_security_group" {
  type = map(object({
    network_security_group_name = string
    location                    = string
    resource_group_name         = string
    security_rule_name          = string
    tags                        = map(string)
  }))

}