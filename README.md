# terraform-azurerm-valheim

Terraform module to deploy a valheim server to Azure Container Instances.

## Requirements

| Name                                                               | Version |
| ------------------------------------------------------------------ | ------- |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | 2.54.0  |

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | 2.54.0  |
| <a name="provider_random"></a> [random](#provider_random)    | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                               | Type     |
| ---------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_container_group.valheim](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/container_group) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/resource_group)        | resource |
| [azurerm_storage_account.valheim](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/storage_account) | resource |
| [azurerm_storage_share.config](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/storage_share)      | resource |
| [azurerm_storage_share.data](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/storage_share)        | resource |
| [random_string.storagename](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                 | resource |

## Inputs

| Name                                                                           | Description                                                                                       | Type     | Default | Required |
| ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- | -------- | ------- | :------: |
| <a name="input_hostname"></a> [hostname](#input_hostname)                      | Hostname to use when deploying container group. Will be postfixed with <region>.azurecontainer.io | `string` | n/a     |   yes    |
| <a name="input_server_name"></a> [server_name](#input_server_name)             | What to call your server                                                                          | `string` | n/a     |   yes    |
| <a name="input_server_password"></a> [server_password](#input_server_password) | The password to set on your server                                                                | `string` | n/a     |   yes    |
| <a name="input_world_name"></a> [world_name](#input_world_name)                | The name for your world                                                                           | `string` | n/a     |   yes    |

## Outputs

No outputs.
