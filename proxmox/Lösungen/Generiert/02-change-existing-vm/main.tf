locals {
  # The update exercise keeps naming and addressing deterministic across participants.
  participant_ip_block_start = 150 + ((var.participant_number - 1) * 10)
  vm_name                    = "${var.base_vm_name}-${var.environment}-${var.participant_id}"
  vm_id                      = var.vm_id_base + var.participant_number
  requested_ipv4             = "${var.ipv4_subnet_prefix}.${local.participant_ip_block_start + var.ipv4_host_offset}"
  requested_ipv4_cidr = "${local.requested_ipv4}/${var.ipv4_prefix_length}"
  ipconfig0           = "ip=${local.requested_ipv4_cidr},gw=${var.ipv4_gateway}"
}

resource "proxmox_vm_qemu" "app_vm" {
  name        = local.vm_name
  description = "Managed by Terraform for the Proxmox workshop"
  tags        = "terraform,workshop,${var.participant_id},${var.environment}"

  target_node            = var.proxmox_node_name
  vmid                   = local.vm_id
  define_connection_info = false
  clone_id               = var.template_vm_id
  full_clone             = true
  os_type                = "cloud-init"
  agent                  = 1
  memory                 = var.vm_memory_mb
  scsihw                 = "virtio-scsi-single"
  bootdisk               = "scsi0"

  cpu {
    type = "host"
    cores = var.vm_cpus
    sockets = 1
  }
  
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

  # The second disk is the key change in this solution.
  disk {
    slot    = "scsi1"
    size    = "${var.data_disk_gb}G"
    type    = "disk"
    storage = var.datastore_id
  }

  ciuser     = var.ci_username
  nameserver = var.nameserver
  ipconfig0  = local.ipconfig0
}
