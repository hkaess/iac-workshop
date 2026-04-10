# Uebung 3: Mehrere VMs deployen

## Lernziel

Das Problem erkennen, das entsteht, wenn dieselbe Infrastruktur mehrfach benoetigt wird.

## Szenario

Nach dem erfolgreichen Einzel-Deployment soll dieselbe VM nun insgesamt 3-mal ausgerollt werden.

## Aufgaben

1. Kopiere `workshop.auto.tfvars.example` zu `workshop.auto.tfvars`.
2. Deploye die VM nicht nur einmal, sondern 3-mal.
3. Sorge dafuer, dass alle 3 VMs eindeutige Namen haben.
4. Sorge dafuer, dass alle 3 VMs eindeutige VM-IDs bekommen.
5. Achte darauf, dass die Namen auch bei allen parallelen Teilnehmenden eindeutig bleiben.
6. Gib die erzeugten VM-Namen und VM-IDs am Ende sinnvoll aus.

## Akzeptanzkriterien

- Es werden 3 VMs deployed.
- Die erzeugten VM-Namen sind bei allen parallelen Teilnehmenden eindeutig.
- VM-IDs sind eindeutig und nachvollziehbar vergeben.
- Die Loesung ist fuer die Teilnehmenden selbst erklaerbar.

## Wo werden Variablen gesetzt?

In `workshop.auto.tfvars` im Verzeichnis dieser Uebung.

