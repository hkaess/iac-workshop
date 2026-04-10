# Terraform Cheat Sheet

Dieses Cheat Sheet ist als schnelle Referenz fuer den Proxmox-Track gedacht.

## Wichtigste Befehle

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

## Wichtigste Block-Typen

### `terraform`

Versionen und benoetigte Provider.

```hcl
terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc06"
    }
  }
}
```

### `provider`

Verbindung zur Zielplattform.

```hcl
provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_user         = var.proxmox_user
  pm_password     = var.proxmox_password
  pm_tls_insecure = var.proxmox_tls_insecure
}
```

### `variable`

Eingaben von aussen.

```hcl
variable "participant_id" {
  type = string
}
```

### `locals`

Intern berechnete Werte.

```hcl
locals {
  vm_name = "iac-${var.participant_id}"
}
```

### `data`

Bestehende Objekte lesen. Im Proxmox-Track arbeiten wir haeufig statt `data` auch mit bekannten IDs oder Namen aus Variablen, zum Beispiel einer Template-VM-ID.

### `resource`

Verwaltete Infrastruktur.

```hcl
resource "proxmox_vm_qemu" "vm" {
  name        = local.vm_name
  target_node = var.proxmox_node_name
  vmid        = local.vm_id
}
```

### `output`

Werte sichtbar machen.

```hcl
output "vm_id" {
  value = proxmox_vm_qemu.vm.vmid
}
```

### `module`

Wiederverwendbare Terraform-Logik kapseln.

```hcl
module "proxmox_vm" {
  source = "./modules/proxmox-vm"
}
```

## Hauefige Meta-Argumente und Funktionen

- `for_each`: mehrere Instanzen aus einer Map
- `count`: mehrere Instanzen ueber eine Zahl
- `coalesce`: ersten nicht-`null`-Wert nehmen
- `try`: ersten gueltigen Ausdruck nehmen
- `dynamic`: optionale Unterbloecke erzeugen

## Typischer Workshop-Ablauf

1. In den Uebungsordner wechseln
2. `workshop.auto.tfvars.example` nach `workshop.auto.tfvars` kopieren
3. Variablen ausfuellen
4. `terraform init`
5. `terraform plan`
6. `terraform apply`

## Telmate-spezifische Begriffe

- `proxmox_vm_qemu`: VM-Ressource fuer QEMU-VMs
- `target_node`: Proxmox-Knoten, auf dem die VM erstellt wird
- `vmid`: numerische VM-ID in Proxmox
- `clone` oder `clone_id`: bestehendes Template als Basis
- `ipconfig0`: Cloud-Init-Netzwerkkonfiguration fuer die erste NIC
- `ciuser`: Cloud-Init-Benutzer
