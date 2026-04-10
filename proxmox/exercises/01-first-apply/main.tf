locals {
  participant_ip_block_start = 150 + ((var.participant_number - 1) * 10)
  vm_name                    = "${var.vm_name_prefix}-${var.participant_id}"
  vm_id                      = var.vm_id_base + (var.participant_number * 10)
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
  memory                 = var.vm_memory_mb
  scsihw                 = "virtio-scsi-single"
  bootdisk               = "scsi0"

  cpu {
    type = "host"
    cores = var.vm_cpus
    sockets = 1
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }

disks {
    scsi {
      scsi0 {
        disk {
          size    = "${var.vm_disk_gb}G"
          storage = var.datastore_id
        }
      }
    }
  }
}
