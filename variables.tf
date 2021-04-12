variable "hostname" {
  description = "Hostname to use when deploying container group. Will be postfixed with <region>.azurecontainer.io"
  type        = string
}

variable "server_name" {
  description = "What to call your server"
  type        = string
}

variable "server_password" {
  description = "The password to set on your server"
  type        = string
}

variable "world_name" {
  description = "The name for your world"
  type        = string
}

variable "adminlist_ids" {
  description = "List of admin SteamIDs"
  type        = list(string)
  default     = []
}

variable "environment_variables" {
  description = "Extra environment variables that will be passed to the valheim server"
  type        = map(any)
  default     = {}
}

variable "valheim_server_image" {
  description = "The name and tag of the container image to run."
  type        = string
  default     = "lloesche/valheim-server"

}

variable "resource_group" {
  description = "The name of the resource group to deploy to"
  type        = string
  default     = "valheim"
}

variable "region" {
  description = "Azure region to deploy to"
  type        = string
  default     = "westeurope"
}