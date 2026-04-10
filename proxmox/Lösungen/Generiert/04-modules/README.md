# Loesung zu Uebung 4

Hier wird die Proxmox-VM-Logik in ein Modul ausgelagert.

Trainer-Punkte:

- Das Root-Modul orchestriert nur noch.
- Das Modul kapselt Clone-, Disk- und Cloud-Init-Logik.
- `participant_id` bleibt im Root-Modul und nicht im Modul selbst.

