output "subnet-id" {
  value = azurerm_subnet.Subnet.id
  description = "resource id of the subnet"
}

output "address-prefixes" {
  value = azurerm_subnet.Subnet.address_prefixes
  description = "address prefixes of the subnet"
}

output "route-table-name" {
  value = azurerm_route_table.RouteTable.name
  description = "name of the route table"
}
