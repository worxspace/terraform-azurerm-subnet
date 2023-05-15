/**
 * # tfm-azure-subnet
 *
 * Creates subnet in azure in a standardised way using the latest recommendations.
 *
 * We use azurecaf_name to generate a unique name for the user assigned identity.
 * so make sure to provide the project-name, prefixes, suffixes as necessary
 */

resource "azurecaf_name" "name" {
  resource_types = [
    "azurerm_subnet",
    "azurerm_route_table"
  ]
  name     = var.project-name
  prefixes = var.resource-prefixes
  suffixes = var.resource-suffixes
}

resource "azurerm_subnet" "Subnet" {
  name                 = azurecaf_name.name.results.azurerm_subnet
  resource_group_name  = var.resource-group-name
  virtual_network_name = var.vnet-name
  address_prefixes     = [var.address-prefix]

  service_endpoints = var.service-endpoints
}

resource "azurerm_route_table" "RouteTable" {
  count = var.firewall-ip == null ? 0 : 1

  name                = azurecaf_name.name.results.azurerm_route_table
  resource_group_name = var.resource-group-name
  location            = var.location

  tags = var.global-tags
}

resource "azurerm_route" "InternetToFirewall" {
  count = var.firewall-ip == null ? 0 : 1
  
  name                   = "InternetToFirewall"
  resource_group_name    = var.resource-group-name
  route_table_name       = azurerm_route_table.RouteTable[0].name
  address_prefix         = "0.0.0.0/0"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.firewall-ip
}

resource "azurerm_subnet_route_table_association" "FirewallRoute" {
  count = var.firewall-ip == null ? 0 : 1

  subnet_id      = azurerm_subnet.Subnet.id
  route_table_id = azurerm_route_table.RouteTable[0].id
}
