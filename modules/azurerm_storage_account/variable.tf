variable "storage_accounts" {
type = map(object({
  sg_name = string
  resource_group_name =string
  location = string
  account_tier =string
  account_replication_type =string
  tags =map(string)

  container_name =string
  container_access_type =string

}))

}
