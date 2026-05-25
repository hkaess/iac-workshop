# Uebung 2: Bestehende VM aendern

## Lernziel

Nach einem ersten Deployment gezielt Aenderungen an bestehender Infrastruktur vornehmen und den Plan sauber lesen.

## Szenario

Die erste VM laeuft bereits. Jetzt kommen neue Anforderungen aus dem Betrieb: mehr CPU, weniger RAM und eine zusaetzliche Festplatte fuer Anwendungsdaten.

## Aufgaben

1. Kopiere alle Files ausser der `README.md` aus Aufgabe 1 in diesen Ordner.
2. Setze die CPU-Anzahl der bestehenden VM auf `4` (vorher: 2).
3. Setze den RAM der bestehenden VM auf `2048` MB (vorher: 4096 MB).
4. Fuege der VM eine zweite Disk mit `50 GB` fuer Daten hinzu.
5. Fuehre `terraform plan` aus und erklaere, welche Aenderungen in-place passieren und was eine Neuanlage triggern wuerde.
6. Wende die Aenderungen mit `terraform apply` an.

## Akzeptanzkriterien

- Die bestehende VM wird gezielt aktualisiert (CPU = 4, RAM = 2048 MB).
- Die zweite Disk mit 50 GB ist als eigener Block modelliert.
- Der VM-Name bleibt pro Teilnehmendem eindeutig.
- Der Plan ist fuer Teilnehmende gut lesbar und diskutierbar.

## Wo werden Variablen gesetzt?

In `workshop.auto.tfvars` im Verzeichnis dieser Uebung.
