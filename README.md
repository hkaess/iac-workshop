# IaC Workshop Exercises for Proxmox VE

Dieses Verzeichnis enthaelt die Praxisaufgaben fuer einen Infrastructure-as-Code-Workshop mit Terraform, Proxmox VE und dem Telmate-Proxmox-Provider.

## Einstieg

- Teilnehmer-Setup: [SETUP.md](./SETUP.md)
- Dokumentationslinks: [docs/links.md](./docs/links.md)
- Terraform Cheat Sheet: [docs/terraform-cheatsheet.md](./docs/terraform-cheatsheet.md)
- Trainer-Loesungen: [Lösungen/README.md](./L%C3%B6sungen/README.md)

## Zielbild

Die Uebungen bauen aufeinander auf:

1. Erstes `terraform apply` mit einer bestehenden VM-Definition
2. Infrastruktur aendern und VM-Konfiguration erweitern
3. Dieselbe VM 5-mal deployen und die entstehende Wiederholung bewusst erleben
4. Wiederverwendbare Module fuer VM-Deployments bauen

## Annahmen

- Fokus: Terraform
- Zielplattform: Proxmox VE
- Im Workshop existiert zu Beginn noch keine deployte VM
- Die erste praktische Aufgabe soll bewusst mit einem echten `apply` starten

## Struktur

```text
exercises/
  01-first-apply/
  02-change-existing-vm/
  03-multiple-vms/
  04-modules/
```

Jede Uebung enthaelt:

- eine Aufgabenbeschreibung in `README.md`
- Starter-Dateien mit TODOs
- eine `workshop.auto.tfvars.example` als Vorlage fuer Variablen
- klare Akzeptanzkriterien

## Hinweise

- Die Beispiele gehen davon aus, dass im Workshop ein Proxmox-Knoten, ein Storage, eine Linux-Bridge und ein cloud-init-faehiges VM-Template vorhanden sind.
- Die Terraform-Beispiele nutzen den `Telmate/proxmox`-Provider mit Benutzer/Passwort-Login.
- Fuer den aktuellen Workshop-IP-Pool sind 8 volle Teilnehmer-Bloecke vorgesehen, zum Beispiel `p01` bis `p08`.
- Variablen werden pro Uebung in einer Datei wie `workshop.auto.tfvars` gesetzt. Terraform liest diese Datei automatisch ein.
