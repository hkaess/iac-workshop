# Terraform Konzepte Kurz Erklaert

Dieses Dokument erklaert die wichtigsten Terraform-Konzepte, die in den spaeteren Loesungen neu dazukommen.

## `locals`

`locals` sind benannte Zwischenwerte innerhalb einer Terraform-Konfiguration.

Beispiel:

```hcl
locals {
  vm_name = "${var.participant_id}-web"
}
```

Warum ist das sinnvoll?

- wiederkehrende Ausdruecke stehen an einer Stelle
- Namen und abgeleitete Werte sind leichter zu lesen
- Aenderungen muessen nicht an mehreren Stellen gemacht werden

## `data`

`data`-Quellen lesen bestehende Objekte aus der Zielplattform.

Beispiel:

```hcl
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter_name
}
```

Warum ist das sinnvoll?

- Namen aus dem vCenter werden zu IDs aufgeloest
- die IDs bleiben in der Konfiguration nicht hartkodiert
- aendert sich ein vCenter-Objekt nur in der Umgebung, reicht eine andere Variable

## `for_each`

`for_each` erzeugt mehrere Instanzen einer Ressource oder eines Moduls aus einer Map oder Menge.

Beispiel:

```hcl
resource "example" "vm" {
  for_each = var.virtual_machines
  name     = each.key
}
```

Warum ist das sinnvoll?

- statt drei fast identischer Resource-Bloecke gibt es nur noch einen
- jede Instanz bleibt ueber ihren Schluessel adressierbar, zum Beispiel `vm["web"]`

## `coalesce`

`coalesce(a, b)` nimmt den ersten Wert, der nicht `null` ist.

Beispiel:

```hcl
memory_mb = coalesce(vm.memory_mb, var.vm_defaults.memory_mb)
```

Das bedeutet:

- wenn `vm.memory_mb` gesetzt ist, wird dieser Wert genutzt
- sonst faellt Terraform auf `var.vm_defaults.memory_mb` zurueck

Warum ist das sinnvoll?

- einzelne VMs koennen Werte ueberschreiben
- gemeinsame Defaults bleiben trotzdem an einer zentralen Stelle

## `try`

`try(a, b)` verwendet den ersten Ausdruck, wenn er funktioniert. Falls dabei ein Fehler entsteht, wird der naechste Ausdruck verwendet.

Beispiel:

```hcl
data_disk_gb = try(each.value.data_disk_gb, null)
```

Das bedeutet:

- wenn `data_disk_gb` in diesem Objekt existiert, wird es verwendet
- wenn nicht, wird `null` eingesetzt

Warum ist das sinnvoll?

- optionale Felder koennen sauber gelesen werden
- nicht jede VM muss dieselben Attribute besitzen

## `dynamic`

Ein `dynamic`-Block erzeugt verschachtelte Konfigurationsbloecke nur dann, wenn sie wirklich gebraucht werden.

Beispiel:

```hcl
dynamic "disk" {
  for_each = var.data_disk_gb == null ? [] : [var.data_disk_gb]
  content {
    label = "disk1"
    size  = disk.value
  }
}
```

Das bedeutet:

- wenn keine zweite Disk gesetzt ist, wird kein zusaetzlicher `disk`-Block erzeugt
- wenn ein Wert vorhanden ist, wird genau ein solcher Block erzeugt

Warum ist das sinnvoll?

- optionale Infrastruktur kann ohne doppelten Code modelliert werden

## `each.key` und `each.value`

Diese Werte gibt es innerhalb von `for_each`.

Beispiel:

```hcl
for_each = var.virtual_machines
name     = each.key
memory   = each.value.memory_mb
```

Das bedeutet:

- `each.key` ist der Schluessel, zum Beispiel `web`
- `each.value` ist das zugehoerige Objekt mit den Daten

## Muster in diesem Workshop

In den Loesungen werden diese Konzepte so eingesetzt:

- `locals`: abgeleitete Namen und IPs
- `data`: Aufloesen von Datacenter, Cluster, Datastore, Netzwerk und Template
- `for_each`: mehrere VMs oder Modulaufrufe
- `coalesce`: Default-Werte mit optionalen Ueberschreibungen
- `try`: optionale Attribute wie `data_disk_gb`
- `dynamic`: optionale zweite Disk im Modul

Wenn ein Begriff in einer Loesung auftaucht und nicht sofort klar ist, sollte zuerst dieses Dokument gelesen werden.
