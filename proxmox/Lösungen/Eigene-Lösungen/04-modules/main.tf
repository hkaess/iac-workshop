module "proxmox_vm" {
  source = "./modules/proxmox-vm"

  participant_id       = var.participant_id
  participant_number   = var.participant_number
  proxmox_node_name   = var.proxmox_node_name
  datastore_id        = var.datastore_id
  network_bridge      = var.network_bridge
  template_vm_id      = var.template_vm_id
  vm_name_prefix      = var.vm_name_prefix
  vm_id_base          = var.vm_id_base
  vm_cpus             = var.vm_cpus
  vm_memory_mb        = var.vm_memory_mb
  vm_disk_gb          = var.vm_disk_gb
  vm_data_disk_gb     = var.vm_data_disk_gb
  vm_count            = var.vm_count
}


