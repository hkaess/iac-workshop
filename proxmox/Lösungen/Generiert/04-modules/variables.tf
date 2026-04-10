variable "proxmox_api_url" {
  type = string
}

variable "proxmox_user" {
  type = string
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "proxmox_tls_insecure" {
  type    = bool
  default = true
}

variable "proxmox_node_name" {
  type = string
}

variable "datastore_id" {
  type = string
}

variable "network_bridge" {
  type = string
}

variable "template_vm_id" {
  type = number
}

variable "participant_id" {
  type = string
}

variable "ci_username" {
  type    = string
  default = "ubuntu"
}

variable "nameserver" {
  type    = string
  default = ""
}

variable "virtual_machines" {
  type = map(object({
    vm_id        = number
    ipconfig0    = string
    cpus         = number
    memory_mb    = number
    disk_gb      = number
    data_disk_gb = optional(number)
  }))
}

