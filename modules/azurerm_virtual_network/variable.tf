variable "virtual_network_test" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnet = optional(list(object({
      name           = string
      address_prefixes = list(string)
    })))
  }))
}
