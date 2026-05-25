# Terraform Cheat Sheet

Dieses Cheat Sheet ist als schnelle Referenz fuer den vSphere-Track gedacht.

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
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.8"
    }
  }
}
```

### `provider`

Verbindung zur Zielplattform.

```hcl
provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = var.vsphere_allow_unverified_ssl
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

Bestehende Objekte aus dem vCenter lesen, z.B. Datacenter, Cluster, Datastore, Netzwerk, Template.

```hcl
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter_name
}
```

### `resource`

Verwaltete Infrastruktur.

```hcl
resource "vsphere_virtual_machine" "vm" {
  name             = local.vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
}
```

### `output`

Werte sichtbar machen.

```hcl
output "vm_uuid" {
  value = vsphere_virtual_machine.vm.uuid
}
```

### `module`

Wiederverwendbare Terraform-Logik kapseln.

```hcl
module "vsphere_vm" {
  source = "./modules/vsphere-vm"
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

## vSphere-spezifische Begriffe

- `vsphere_virtual_machine`: VM-Ressource fuer vSphere/vCenter
- `resource_pool_id`: Resource Pool, in dem die VM laeuft (kommt typischerweise aus dem Cluster)
- `datastore_id`: Ziel-Datastore fuer die Disks
- `clone { template_uuid = ... }`: bestehendes Template als Basis
- `network_interface`: NIC inkl. Port Group (Netzwerk)
- `disk`: Disks der VM, jeweils mit `label` und `unit_number`
- `guest_id`: Gast-OS-Typ, z.B. `ubuntu64Guest`
