variable "vault_addr" {
  description = "The address of the Vault server"
  default = "http://127.0.0.1:8200"
  type = string
}

variable "token" {
  description = "The Vault token to be used"
  type = string
}

variable "kv_path" {
  description = "The path of the kv secrets engine"
  type = string
}

variable "up_path" {
  description = "The path of the userpass auth engine"
  type = string
}
