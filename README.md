# tfm-azure-subnet

Creates subnet in azure in a standardised way using the latest recommendations.

We use azurecaf\_name to generate a unique name for the user assigned identity.
so make sure to provide the project-name, prefixes, suffixes as necessary

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | >=2.0.0-preview3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | >=2.0.0-preview3 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.name](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_route.InternetToFirewall](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.RouteTable](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurerm_subnet.Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_route_table_association.FirewallRoute](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address-prefix"></a> [address-prefix](#input\_address-prefix) | value for the address prefix of the subnet | `string` | n/a | yes |
| <a name="input_firewall-ip"></a> [firewall-ip](#input\_firewall-ip) | value for the ip address of the firewall where default internet route is to be created. If null, then no route is created | `string` | n/a | yes |
| <a name="input_global-tags"></a> [global-tags](#input\_global-tags) | tags to be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | value for the location of the virtual machines | `string` | `"switzerlandnorth"` | no |
| <a name="input_project-name"></a> [project-name](#input\_project-name) | used as the main part of the name of the virtual machine | `string` | n/a | yes |
| <a name="input_resource-group-name"></a> [resource-group-name](#input\_resource-group-name) | resource group where you want to create the virtual machines | `string` | n/a | yes |
| <a name="input_resource-prefixes"></a> [resource-prefixes](#input\_resource-prefixes) | these are prefixed to resource names and usually include the tenant short name and/or the environment name | `list(string)` | `[]` | no |
| <a name="input_resource-suffixes"></a> [resource-suffixes](#input\_resource-suffixes) | these are appended to resource names and usually include the numbers when multiple resource with the same name exist | `list(string)` | `[]` | no |
| <a name="input_vnet-name"></a> [vnet-name](#input\_vnet-name) | value for the name of the virtual network where subnet is to be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address-prefixes"></a> [address-prefixes](#output\_address-prefixes) | address prefixes of the subnet |
| <a name="output_route-table-name"></a> [route-table-name](#output\_route-table-name) | name of the route table |
| <a name="output_subnet-id"></a> [subnet-id](#output\_subnet-id) | resource id of the subnet |
