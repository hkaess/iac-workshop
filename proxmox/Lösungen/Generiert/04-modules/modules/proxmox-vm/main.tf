resource "proxmox_vm_qemu" "this" {
  # The module owns the VM implementation details so the root module stays small.
  name        = var.name
  description = "Managed by Terraform for the Proxmox workshop"
  tags        = "terraform,workshop"

  target_node            = var.node_name
  vmid                   = var.vm_id
  define_connection_info = false
  clone_id               = var.template_vm_id
  full_clone             = true
  os_type                = "cloud-init"
  agent                  = 1
  memory                 = var.memory_mb
  scsihw                 = "virtio-scsi-single"
  bootdisk               = "scsi0"

  cpu {
    type = "host"
    cores = var.vm_cpus
    sockets = 1
  }

  disk {
    slot    = "scsi0"
    size    = "${var.disk_gb}G"
    type    = "disk"
    storage = var.datastore_id
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }

  dynamic "disk" {
    # [] means no extra disk, [value] means exactly one extra disk block.
    for_each = var.data_disk_gb == null ? [] : [var.data_disk_gb]

    content {
      slot    = "scsi1"
      size    = "${disk.value}G"
      type    = "disk"
      storage = var.datastore_id
    }
  }

  ciuser     = var.ci_username
  nameserver = var.nameserver
  ipconfig0  = var.ipconfig0
}
