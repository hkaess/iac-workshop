output "vm_names" {
  value = {
    for name, vm in proxmox_vm_qemu.vm : name => vm.name
  }
}

output "vm_ids" {
  value = {
    for name, vm in proxmox_vm_qemu.vm : name => vm.vmid
  }
}

output "requested_ipconfig0" {
  value = {
    for name, cfg in local.vm_instances : name => cfg.ipconfig0
  }
}

output "default_ipv4_addresses" {
  value = {
    for name, vm in proxmox_vm_qemu.vm : name => vm.default_ipv4_address
  }
}
