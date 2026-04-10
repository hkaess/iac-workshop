# Loesung zu Uebung 3

Die Aufgabe ist absichtlich offen gestellt. Diese Trainerloesung waehlt `for_each`, weil damit auch 5 fast identische Proxmox-VMs sauber und nachvollziehbar deployt werden koennen.

Wichtige Punkte:

- `local.vm_instances` bereitet Namen, VM-IDs und IPs vor
- `for_each` ersetzt Copy-and-paste
- die Outputs bleiben pro VM sauber adressierbar

