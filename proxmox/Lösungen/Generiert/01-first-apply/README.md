# Loesung zu Uebung 1

Die Musterloesung deployt eine einzelne Proxmox-VM aus einem bestehenden Template.

Wichtige Punkte:

- `locals` leiten Name, VM-ID und IPv4-Adresse zentral ab
- die VM klont aus einer vorhandenen Template-VM
- Outputs zeigen Name, VM-ID und die vom Provider gemeldeten IP-Adressen

