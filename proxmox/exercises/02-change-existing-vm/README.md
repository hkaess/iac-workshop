# Uebung 2: Bestehende VM aendern

## Lernziel

Nach einem ersten Deployment gezielt Aenderungen an bestehender Infrastruktur vornehmen und den Plan sauber lesen.

## Szenario

Die erste VM laeuft bereits. Jetzt kommen neue Anforderungen aus dem Betrieb: mehr RAM, ein anderer VM-Name fuer die Umgebung und eine zusaetzliche Festplatte fuer Anwendungsdaten.

## Aufgaben

1. Kopiere `workshop.auto.tfvars.example` zu `workshop.auto.tfvars`, falls die Datei noch fehlt.
2. Passe CPU oder RAM der bestehenden VM an.
3. Fuege eine zweite Disk fuer Daten hinzu.
4. Nutze `participant_id` und `environment` im VM-Namen.
5. Fuehre `terraform plan` aus und erklaere, welche Aenderungen in-place passieren und was eine Neuanlage triggern wuerde.
6. Wende die Aenderungen mit `terraform apply` an.

## Akzeptanzkriterien

- Die bestehende VM wird gezielt aktualisiert.
- Die zweite Disk ist als eigener Block modelliert.
- Der VM-Name ist pro Teilnehmendem eindeutig.
- Der Plan ist fuer Teilnehmende gut lesbar und diskutierbar.

## Wo werden Variablen gesetzt?

In `workshop.auto.tfvars` im Verzeichnis dieser Uebung.

