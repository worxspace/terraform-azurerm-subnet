variable "resource-group-name" {
  description = "resource group where you want to create the virtual machines"
  type        = string
}

variable "location" {
  type        = string
  default     = "switzerlandnorth"
  description = "value for the location of the virtual machines"
}

variable "project-name" {
  type        = string
  description = "used as the main part of the name of the virtual machine"
}

variable "resource-prefixes" {
  type        = list(string)
  description = "these are prefixed to resource names and usually include the tenant short name and/or the environment name"

  default = []
}

variable "resource-suffixes" {
  type        = list(string)
  description = "these are appended to resource names and usually include the numbers when multiple resource with the same name exist"

  default = []
}

variable "vnet-name" {
  type = string
  description = "value for the name of the virtual network where subnet is to be created"
}

variable "address-prefix" {
  type = string
  description = "value for the address prefix of the subnet"
}

variable "firewall-ip" {
  type = string
  description = "value for the ip address of the firewall where default internet route is to be created. If null, then no route is created"
}

variable "global-tags" {
  type        = map(string)
  default     = {}
  description = "tags to be applied to all resources"
}