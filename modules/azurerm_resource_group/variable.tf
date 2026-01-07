variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string, "managed-by-test")
    tags       = optional(map(string), {
      environment = "dev"
      Dpt         = "IT"
      managed_by   = "Terraform"
    })
  }))
}