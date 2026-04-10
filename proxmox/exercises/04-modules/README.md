# Uebung 4: Module fuer Proxmox-VMs

## Lernziel

Vorhandenen Terraform-Code in ein wiederverwendbares Modul ueberfuehren und eine klare Root-Module-Struktur aufbauen.

## Szenario

Das Team moechte kuenftig nicht fuer jede neue VM dieselbe Clone-Logik kopieren. Dafuer soll ein allgemeines Proxmox-VM-Modul entstehen.

## Aufgaben

1. Kopiere alle Files außer der README.md aus Aufgabe 3 in diesen Ordner.
2. Erstelle unter `modules/proxmox-vm` ein eigenes Terraform-Modul.
3. Verschiebe die VM-spezifischen Ressourcen aus Uebung 3 in dieses Modul.
4. Definiere eine saubere Modul-Schnittstelle.
5. Binde das Modul im Root-Modul unter `main.tf` ein.
6. Halte Benennung und Struktur so, dass weitere VM-Rollen spaeter leicht hinzukommen.
7. Stelle sicher, dass `participant_id` in die erzeugten Namen einfliessen kann.

## Akzeptanzkriterien

- Das Root-Modul bleibt schlank und orchestriert nur noch.
- Das Modul enthaelt die eigentliche Clone- und VM-Logik.
- Inputs und Outputs sind verstaendlich benannt und wiederverwendbar.
- Das Modul kann fuer mehrere Teilnehmende parallel genutzt werden, ohne Namenskollisionen zu erzeugen.

