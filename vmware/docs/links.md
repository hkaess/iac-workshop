# Hilfreiche Links

Diese Sammlung enthaelt offizielle oder primaere Dokumentation als Hilfestellung fuer die vSphere-Aufgaben.

## Erst lesen bei neuen Terraform-Begriffen

- Workshop-Erklaerhilfe:
  [Terraform Konzepte Kurz Erklaert](./terraform-concepts.md)
- Terraform Cheat Sheet:
  [Terraform Cheat Sheet](./terraform-cheatsheet.md)

## Allgemein

- Terraform Provider-Grundlagen:
  [Configure Terraform providers](https://developer.hashicorp.com/terraform/tutorials/configuration-language/configure-providers)
- Provider-Projekt:
  [hashicorp/terraform-provider-vsphere](https://github.com/hashicorp/terraform-provider-vsphere)
- Provider in der Registry:
  [hashicorp/vsphere on Terraform Registry](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs)

## Besonders hilfreich fuer Uebung 1 und 2

- VM Resource:
  [vsphere_virtual_machine](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine)
- Klonen von Templates:
  [Cloning and customization](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine#cloning-and-customization-example)
- Data Sources:
  [vsphere_datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter),
  [vsphere_compute_cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/compute_cluster),
  [vsphere_datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore),
  [vsphere_network](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network),
  [vsphere_virtual_machine (Template)](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/virtual_machine)
- Terraform Outputs:
  [Output values](https://developer.hashicorp.com/terraform/language/values/outputs)

## Besonders hilfreich fuer Uebung 3

- Mehrere Ressourcen mit `for_each`:
  [for_each meta-argument reference](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)
- Terraform-Funktion fuer Default-Werte:
  [coalesce function](https://developer.hashicorp.com/terraform/language/functions/coalesce)

## Besonders hilfreich fuer Uebung 4

- Module aufbauen und verwenden:
  [Module block reference](https://developer.hashicorp.com/terraform/language/modules/syntax)
- Terraform-Funktion fuer optionale Attribute:
  [try function](https://developer.hashicorp.com/terraform/language/functions/try)
- Dynamische Unterbloecke:
  [Dynamic blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks)
