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
  type            = map
  default         = {}
}