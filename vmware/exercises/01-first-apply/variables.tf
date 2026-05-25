# vCenter / vSphere Verbindungsvariablen
variable "vsphere_server" {
  type        = string
  description = "vCenter Server Hostname oder FQDN, z.B. vcenter.example.com"
}

variable "vsphere_user" {
  type        = string
  description = "vCenter Benutzer, z.B. terraform@vsphere.local"
}

variable "vsphere_password" {
  type      = string
  sensitive = true
}

variable "vsphere_allow_unverified_ssl" {
  type    = bool
  default = true
}

# Umgebungsspezifische Variablen
variable "vsphere_datacenter_name" {
  type        = string
  description = "Name des vSphere Datacenters"
}

variable "vsphere_cluster_name" {
  type        = string
  description = "Name des Compute Clusters"
}

variable "vsphere_datastore_name" {
  type        = string
  description = "Name des Ziel-Datastores"
}

variable "vsphere_network_name" {
  type        = string
  description = "Name der Port Group / des Netzwerks"
}

variable "vsphere_folder" {
  type        = string
  default     = null
  description = "Optionaler VM-Folder-Pfad, z.B. workshop"
}

variable "template_name" {
  type        = string
  description = "Name des Quell-Templates (VM-Template in vCenter)"
}

# Teilnehmerspezifische Variablen
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

# VM-spezifische Variablen
variable "vm_name_prefix" {
  type    = string
  default = "iac-workshop"
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
