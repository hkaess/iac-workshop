output "vm_names" {
  value = {
    for name, vm in module.proxmox_vm : name => vm.vm_name
  }
}

output "vm_ids" {
  value = {
    for name, vm in module.proxmox_vm : name => vm.vm_id
  }
}

output "default_ipv4_addresses" {
  value = {
    for name, vm in module.proxmox_vm : name => vm.default_ipv4_address
  }
}
