variable "resource-group-name" {
  type = string
  description = "value of the resource group name"
}

variable "location" {
  type    = string
  default = "switzerlandnorth"
  description = "location for azure resource deployment"
}

variable "name" {
  type = string
  description = "value of the subnet name"
}

variable "tenant-short-name" {
  type = string
  
}

variable "vnet-name" {
  type = string
}

variable "address-space" {
  type = string
}

variable "firewall-ip" {
  type = string
}

variable "global-tags" {
  type        = map(string)
  default     = {}
  description = "tags to be applied to all resources"
}