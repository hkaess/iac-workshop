locals {
  # Name, VM-ID and IP are derived once so the logic is easy to review and change.
  participant_ip_block_start = 150 + ((var.participant_number - 1) * 10)
  vm_name                    = "${var.vm_name_prefix}-${var.participant_id}"
  vm_id                      = var.vm_id_base + var.participant_number
  requested_ipv4             = "${var.ipv4_subnet_prefix}.${local.participant_ip_block_start}"
  requested_ipv4_cidr = "${local.requested_ipv4}/${var.ipv4_prefix_length}"
  ipconfig0           = "ip=${local.requested_ipv4_cidr},gw=${var.ipv4_gateway}"
}

resource "proxmox_vm_qemu" "workshop_vm" {
  name        = local.vm_name
  description = "Managed by Terraform for the Proxmox workshop"
  tags        = "terraform,workshop,${var.participant_id}"

  target_node            = var.proxmox_node_name
  vmid                   = local.vm_id
  define_connection_info = false
  clone_id               = var.template_vm_id
  full_clone             = true
  os_type                = "cloud-init"
  agent                  = 1
  cores                  = var.vm_cpus
  sockets                = 1
  cpu                    = "host"
  memory                 = var.vm_memory_mb
  scsihw                 = "virtio-scsi-single"
  bootdisk               = "scsi0"

  disk {
    slot    = "scsi0"
    size    = "${var.vm_disk_gb}G"
    type    = "disk"
    storage = var.datastore_id
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }

  ciuser     = var.ci_username
  nameserver = var.nameserver
  ipconfig0  = local.ipconfig0
}
