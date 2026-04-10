variable "name" {
  type = string
}

variable "node_name" {
  type = string
}

variable "vm_id" {
  type = number
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

variable "cpus" {
  type = number
}

variable "memory_mb" {
  type = number
}

variable "disk_gb" {
  type = number
}

variable "data_disk_gb" {
  type    = number
  default = null
}

variable "ipconfig0" {
  type = string
}

variable "ci_username" {
  type = string
}

variable "nameserver" {
  type = string
}
