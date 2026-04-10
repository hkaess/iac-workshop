# Workshop Setup

Dieses Dokument ist fuer Teilnehmende gedacht, die zum ersten Mal mit dem Proxmox-Track arbeiten.

## Ziel

Am Ende des Setups kannst du in einer Uebung:

- Variablen an der richtigen Stelle setzen
- `terraform init` ausfuehren
- `terraform plan` lesen
- `terraform apply` fuer deine eigene VM starten

## Voraussetzungen

Vor dem Workshop solltest du haben:

- Terraform lokal installiert
- Zugriff auf die bereitgestellte Proxmox-Umgebung
- einen Proxmox-Benutzer und das zugehoerige Passwort
- die von der Trainerin oder dem Trainer genannten Werte fuer Node, Storage, Netzwerk-Bridge und Template-VM

## Grundprinzip

Jede Uebung ist ein eigenes Terraform-Projekt in einem eigenen Ordner.

Wichtig:

- Arbeite immer im Ordner der aktuellen Uebung
- Setze Variablen in `workshop.auto.tfvars`
- Nutze eine eindeutige `participant_id`, zum Beispiel `p01` bis `p10`
- Nutze deine `participant_number`, damit Namen, VM-IDs und IPs eindeutig bleiben

## IP-Adressbereiche im Workshop

Der Workshop nutzt den Pool:

```text
10.0.50.150 - 10.0.50.230
```

Jede Person erhaelt daraus einen eigenen 10er-Block:

- `p01`: `10.0.50.150` bis `10.0.50.159`
- `p02`: `10.0.50.160` bis `10.0.50.169`
- `p03`: `10.0.50.170` bis `10.0.50.179`
- ...
- `p08`: `10.0.50.220` bis `10.0.50.229`

Wichtig:

- Mit diesem Pool sind 8 volle 10er-Bloecke moeglich.
- `10.0.50.230` bleibt als einzelne Reserve-IP uebrig.
- Falls wirklich 10 Teilnehmende jeweils 10 IPs brauchen, muss der Pool erweitert werden.

## Schnellstart

### 1. In die gewuenschte Uebung wechseln

```bash
cd exercises/01-first-apply
```

### 2. Beispiel-Datei fuer Variablen kopieren

```bash
cp workshop.auto.tfvars.example workshop.auto.tfvars
```

### 3. `workshop.auto.tfvars` ausfuellen

Dort setzt du deine Workshop-Werte, zum Beispiel:

```hcl
participant_id     = "p03"
participant_number = 3
proxmox_api_url    = "https://pve.example.com:8006/api2/json/"
proxmox_user       = "terraform@pve"
proxmox_password   = "CHANGE_ME"
proxmox_node_name  = "pve01"
template_vm_id     = 9000
```

Wichtig:

- bei `proxmox_api_url` sollte die API-URL inklusive `/api2/json/` verwendet werden
- der Proxmox-Track nutzt bewusst User/Password-Login statt API-Token

## Wo setze ich Variablen?

Immer in der Datei:

```text
workshop.auto.tfvars
```

im jeweiligen Uebungsordner.

Terraform liest diese Datei automatisch ein. Du musst sie also nicht extra per `-var-file` angeben.

## Empfohlener Ablauf pro Uebung

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Teilnehmer-Eindeutigkeit

Damit bei mehreren Personen keine Kollisionen entstehen:

- hat jede Person eine eigene `participant_id`
- hat jede Person eine eigene `participant_number`
- werden VM-Namen, VM-IDs und IPs aus diesen Werten abgeleitet

## Typische Fehler

Wenn `terraform plan` oder `terraform apply` fehlschlaegt, pruefe zuerst:

- Bist du im richtigen Uebungsordner?
- Existiert eine `workshop.auto.tfvars`?
- Sind `participant_id` und `participant_number` gesetzt?
- Stimmen Node, Storage, Bridge und Template-VM?
- Stimmt die API-URL inklusive `/api2/json/`?
- Sind Benutzername und Passwort korrekt?
- Ist das Template cloud-init-faehig?
- Ist der QEMU Guest Agent im Template aktiviert, falls IP-Adressen sauber ausgelesen werden sollen?
