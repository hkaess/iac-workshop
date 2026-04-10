locals {
  # The solution prepares all five VM instances up front so the resource block stays compact.
  participant_ip_block_start = 150 + ((var.participant_number - 1) * 10)
  vm_instances = {
    for idx in range(5) : format("vm%02d", idx + 1) => {
      name                = "${var.vm_name_prefix}-${var.participant_id}-${format("%02d", idx + 1)}"
      vm_id               = var.vm_id_base + (var.participant_number * 10) + idx + 1
      requested_ipv4      = "${var.ipv4_subnet_prefix}.${local.participant_ip_block_start + idx}"
      requested_ipv4_cidr = format("%s/%d", "${var.ipv4_subnet_prefix}.${local.participant_ip_block_start + idx}", var.ipv4_prefix_length)
      ipconfig0           = format("ip=%s/%d,gw=%s", "${var.ipv4_subnet_prefix}.${local.participant_ip_block_start + idx}", var.ipv4_prefix_length, var.ipv4_gateway)
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  # for_each is one clean way to solve the "deploy this VM five times" requirement.
  for_each = local.vm_instances

  name        = each.value.name
  description = "Managed by Terraform for the Proxmox workshop"
  tags        = "terraform,workshop,${var.participant_id}"

  target_node            = var.proxmox_node_name
  vmid                   = each.value.vm_id
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

  ciuser     = var.ci_username
  nameserver = var.nameserver
  ipconfig0  = each.value.ipconfig0
}
