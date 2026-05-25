# Uebung 4: Module fuer vSphere-VMs

## Lernziel

Vorhandenen Terraform-Code in ein wiederverwendbares Modul ueberfuehren und eine klare Root-Module-Struktur aufbauen.

## Szenario

Das Team moechte kuenftig nicht fuer jede neue VM dieselbe Clone-Logik kopieren. Dafuer soll ein allgemeines vSphere-VM-Modul entstehen.

## Aufgaben

1. Kopiere alle Files ausser der `README.md` aus Aufgabe 3 in diesen Ordner.
2. Erstelle unter `modules/vsphere-vm` ein eigenes Terraform-Modul mit `main.tf`, `variables.tf` und `outputs.tf`.
3. Verschiebe die VM-spezifischen Ressourcen (z.B. `vsphere_virtual_machine`) aus Aufgabe 3 in dieses Modul.
4. Definiere eine saubere Modul-Schnittstelle: Inputs fuer Name, CPU (`4`), RAM (`2048` MB), Disks, Netzwerk, Datastore-ID, Resource-Pool-ID, Template-UUID; Outputs fuer Name und UUID.
5. Binde das Modul im Root-Modul unter `main.tf` ein und deploye damit weiterhin genau `3` VMs.
6. Die `data`-Quellen fuer Datacenter, Cluster, Datastore, Netzwerk und Template bleiben sinnvollerweise im Root-Modul und werden ans Modul als IDs durchgereicht.
7. Halte Benennung und Struktur so, dass weitere VM-Rollen spaeter leicht hinzukommen.
8. Stelle sicher, dass `participant_id` in die erzeugten Namen einfliessen kann.

## Akzeptanzkriterien

- Das Root-Modul bleibt schlank und orchestriert nur noch.
- Das Modul enthaelt die eigentliche Clone- und VM-Logik.
- Inputs und Outputs sind verstaendlich benannt und wiederverwendbar.
- Das Modul kann fuer mehrere Teilnehmende parallel genutzt werden, ohne Namenskollisionen zu erzeugen.

## Wo werden Variablen gesetzt?

In `workshop.auto.tfvars` im Verzeichnis dieser Uebung.
