# terraform-azurerm-valheim

Terraform module to deploy a Valheim server to Azure Container Instances. This is based on the great work done over at [lloesche/valheim-server-docker]https://github.com/lloesche/valheim-server-docker) to containerize the Valheim server.

This module will deploy a container group to azure and will include a daily snapshot of the file shared mounted to the container should you need to restore your world.

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

| Name                                                                                                                                                                              | Type     |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [azurerm_backup_container_storage_account.protection-container](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/backup_container_storage_account) | resource |
| [azurerm_backup_policy_file_share.daily](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/backup_policy_file_share)                                | resource |
| [azurerm_backup_protected_file_share.config](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/backup_protected_file_share)                         | resource |
| [azurerm_backup_protected_file_share.data](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/backup_protected_file_share)                           | resource |
| [azurerm_container_group.valheim](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/container_group)                                                | resource |
| [azurerm_recovery_services_vault.vault](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/recovery_services_vault)                                  | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/resource_group)                                                       | resource |
| [azurerm_storage_account.valheim](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/storage_account)                                                | resource |
| [azurerm_storage_share.config](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/storage_share)                                                     | resource |
| [azurerm_storage_share.data](https://registry.terraform.io/providers/hashicorp/azurerm/2.54.0/docs/resources/storage_share)                                                       | resource |
| [random_string.storagename](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)                                                                | resource |

## Inputs

| Name                                                                                             | Description                                                                                       | Type           | Default                     | Required |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------- | -------------- | --------------------------- | :------: |
| <a name="input_adminlist_ids"></a> [adminlist_ids](#input_adminlist_ids)                         | List of admin SteamIDs                                                                            | `list(string)` | `[]`                        |    no    |
| <a name="input_environment_variables"></a> [environment_variables](#input_environment_variables) | Extra environment variables that will be passed to the valheim server                             | `map(any)`     | `{}`                        |    no    |
| <a name="input_hostname"></a> [hostname](#input_hostname)                                        | Hostname to use when deploying container group. Will be postfixed with <region>.azurecontainer.io | `string`       | n/a                         |   yes    |
| <a name="input_region"></a> [region](#input_region)                                              | Azure region to deploy to                                                                         | `string`       | `"westeurope"`              |    no    |
| <a name="input_resource_group"></a> [resource_group](#input_resource_group)                      | The name of the resource group to deploy to                                                       | `string`       | `"valheim"`                 |    no    |
| <a name="input_server_name"></a> [server_name](#input_server_name)                               | What to call your server                                                                          | `string`       | n/a                         |   yes    |
| <a name="input_server_password"></a> [server_password](#input_server_password)                   | The password to set on your server                                                                | `string`       | n/a                         |   yes    |
| <a name="input_valheim_server_image"></a> [valheim_server_image](#input_valheim_server_image)    | The name and tag of the container image to run.                                                   | `string`       | `"lloesche/valheim-server"` |    no    |
| <a name="input_world_name"></a> [world_name](#input_world_name)                                  | The name for your world                                                                           | `string`       | n/a                         |   yes    |

## Outputs

No outputs.
