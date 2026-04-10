module "proxmox_vm" {
  source = "./modules/proxmox-vm"

  # The root module only composes shared settings with per-VM values.
  for_each = var.virtual_machines

  name           = "${var.participant_id}-${each.key}"
  node_name      = var.proxmox_node_name
  vm_id          = each.value.vm_id
  datastore_id   = var.datastore_id
  network_bridge = var.network_bridge
  template_vm_id = var.template_vm_id
  cpus           = each.value.cpus
  memory_mb      = each.value.memory_mb
  disk_gb        = each.value.disk_gb
  data_disk_gb   = try(each.value.data_disk_gb, null)
  ipconfig0      = each.value.ipconfig0
  ci_username    = var.ci_username
  nameserver     = var.nameserver
}
