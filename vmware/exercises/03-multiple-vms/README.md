# Uebung 3: Mehrere VMs deployen

## Lernziel

Das Problem erkennen, das entsteht, wenn dieselbe Infrastruktur mehrfach benoetigt wird.

## Szenario

Nach dem erfolgreichen Einzel-Deployment soll dieselbe VM nun insgesamt `3`-mal ausgerollt werden.

## Aufgaben

1. Kopiere alle Files ausser der `README.md` aus Aufgabe 2 in diesen Ordner.
2. Deploye die VM genau `3`-mal (statt einmal).
3. Sorge dafuer, dass alle 3 VMs eindeutige Namen bekommen (z.B. mit einem Suffix `-1`, `-2`, `-3` zusaetzlich zur `participant_id`).
4. Achte darauf, dass die Namen auch bei allen parallelen Teilnehmenden eindeutig bleiben.
5. Gib die erzeugten VM-Namen und VM-UUIDs am Ende als Outputs sinnvoll aus.

## Akzeptanzkriterien

- Es werden genau 3 VMs deployed.
- Die erzeugten VM-Namen sind bei allen parallelen Teilnehmenden eindeutig.
- VM-UUIDs werden im Output sichtbar gemacht.
- Die Loesung ist fuer die Teilnehmenden selbst erklaerbar.

## Wo werden Variablen gesetzt?

In `workshop.auto.tfvars` im Verzeichnis dieser Uebung.
