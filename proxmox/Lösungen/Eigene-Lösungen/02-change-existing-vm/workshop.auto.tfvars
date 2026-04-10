participant_id     = "p01"
participant_number = 1

proxmox_api_url      = "https://10.0.50.20:8006/api2/json"
proxmox_user         = "terraform-prov@pve"
proxmox_password     = "Start123$"
proxmox_tls_insecure = true

proxmox_node_name = "pve"
datastore_id      = "local-lvm"
network_bridge    = "vmbr0"
template_vm_id    = 902

vm_name_prefix    = "iac-workshop"
vm_id_base        = 8000
vm_cpus           = 1
vm_memory_mb      = 6144
vm_disk_gb        = 100
vm_data_disk_gb   = 40
