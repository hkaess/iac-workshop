output "vm_name" {
  value = proxmox_vm_qemu.workshop_vm[0].name
}

output "vm_id" {
  value = proxmox_vm_qemu.workshop_vm[0].vmid
}

output "vm_name1" {
  value = proxmox_vm_qemu.workshop_vm[1].name
}

output "vm_id1" {
  value = proxmox_vm_qemu.workshop_vm[1].vmid
}

output "vm_name2" {
  value = proxmox_vm_qemu.workshop_vm[2].name
}

output "vm_id2" {
  value = proxmox_vm_qemu.workshop_vm[2].vmid
}