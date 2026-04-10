output "vm_name" { value = proxmox_vm_qemu.workshop_vm.name }
output "vm_id" { value = proxmox_vm_qemu.workshop_vm.vmid }
output "requested_ipconfig0" { value = local.ipconfig0 }
output "default_ipv4_address" { value = proxmox_vm_qemu.workshop_vm.default_ipv4_address }
