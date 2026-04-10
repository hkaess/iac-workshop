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

variable "participant_number" {
  type = number
  validation {
    condition     = var.participant_number >= 1 && var.participant_number <= 8
    error_message = "participant_number must be between 1 and 8 because the current workshop IP pool only provides 8 full blocks of 10 IPs."
  }
}

variable "vm_name_prefix" {
  type    = string
  default = "iac-workshop"
}

variable "vm_id_base" {
  type    = number
  default = 8000
}

variable "vm_cpus" {
  type    = number
  default = 2
}

variable "vm_memory_mb" {
  type    = number
  default = 4096
}

variable "vm_disk_gb" {
  type    = number
  default = 100
}

variable "vm_data_disk_gb" {
  type    = number
  default = 40
}

variable "vm_count" {
  type    = number
  default = 1
}