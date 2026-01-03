variable "vms" {
  description = "A map of VM configurations"
  type = map(object({
    VM_name              = string
    subnet_name          = string
    virtual_network_name = string
    location             = string
    resource_group_name  = string
    nic_name             = string
  }))
} 
