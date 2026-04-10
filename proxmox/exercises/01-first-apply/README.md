# Uebung 1: Erstes Apply

## Lernziel

Den Terraform-Workflow mit einem echten ersten Deployment erleben:

- Variablen bereitstellen
- `terraform init`
- `terraform plan`
- `terraform apply`

## Szenario

Zu Beginn ist noch nichts deployed. Dein Ziel ist es, mit einer vorbereiteten Proxmox-Konfiguration eine erste Linux-VM aus einem bestehenden Template auszurollen.

## Aufgaben

1. Kopiere `workshop.auto.tfvars.example` zu `workshop.auto.tfvars`.
2. Trage die fehlenden Variablenwerte fuer deine Workshop-Umgebung ein.
3. Setze eine eindeutige `participant_id` und `participant_number`.
4. Schau dir zuerst den `locals`-Block in `main.tf` an und erklaere, warum Name und VM-ID zentral abgeleitet werden.
5. Fuehre `terraform init` und danach `terraform apply` aus.
6. Pruefe im Proxmox-UI, ob die VM erfolgreich angelegt wurde.
7. Gib den VM-Namen und die VM-ID als Outputs aus.

## Akzeptanzkriterien

- Die erste VM wird erfolgreich deployed.
- Name und VM-ID sind pro Teilnehmendem eindeutig.
- Das Deployment basiert auf einem bestehenden Proxmox-Template.
- `terraform plan` zeigt nachvollziehbar, was erstellt wird.
- Outputs machen die wichtigsten Ergebnisse sichtbar.

## Wo werden Variablen gesetzt?

In `workshop.auto.tfvars` im Verzeichnis dieser Uebung.

## Reflexionsfragen

- Warum sind `locals` hier sinnvoller als dieselben Ausdruecke mehrfach direkt in den Ressourcen zu verteilen?