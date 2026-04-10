# Hilfreiche Links

Diese Sammlung enthaelt offizielle oder primaere Dokumentation als Hilfestellung fuer die Proxmox-Aufgaben.

## Erst lesen bei neuen Terraform-Begriffen

- Workshop-Erklaerhilfe:
  [Terraform Konzepte Kurz Erklaert](./terraform-concepts.md)
- Terraform Cheat Sheet:
  [Terraform Cheat Sheet](./terraform-cheatsheet.md)

## Allgemein

- Terraform Provider-Grundlagen:
  [Configure Terraform providers](https://developer.hashicorp.com/terraform/tutorials/configuration-language/configure-providers)
- Provider-Projekt:
  [Telmate/terraform-provider-proxmox](https://github.com/Telmate/terraform-provider-proxmox)

## Besonders hilfreich fuer Uebung 1 und 2

- Proxmox VM Resource:
  [vm_qemu.md](https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/resources/vm_qemu.md)
- Provider Releases:
  [Provider Releases on GitHub](https://github.com/Telmate/terraform-provider-proxmox/releases)
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
