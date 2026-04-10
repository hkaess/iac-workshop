output "vm_name" { value = proxmox_vm_qemu.this.name }
output "vm_id" { value = proxmox_vm_qemu.this.vmid }
output "default_ipv4_address" { value = proxmox_vm_qemu.this.default_ipv4_address }
