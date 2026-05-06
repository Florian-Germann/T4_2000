# Arbeiten mit Git & GitHub (mit GitHub Desktop)

## Einführung
Git ist ein Versionskontrollsystem, das es ermöglicht, Änderungen an Dateien nachzuverfolgen und gemeinsam an Projekten zu arbeiten.  
GitHub erweitert Git um eine Plattform für Zusammenarbeit, Code-Hosting und Projektmanagement.

GitHub Desktop bietet eine grafische Oberfläche, um Git ohne Kommandozeile zu nutzen.

Die wesentlichen Inhalte sind bereits in der Präsentation unter https://fptsystems.sharepoint.com/:p:/r/sites/fptO-SW/_layouts/15/Doc2.aspx?action=edit&sourcedoc=%7B7a8594e8-8a01-47b3-8dcb-4f2c872ff129%7D&wdExp=TEAMS-TREATMENT&web=1&linkOpenTime=1778059081883 beschrieben.

---

## Was ist Git?

Git ist ein verteiltes Versionsverwaltungssystem.

### Hauptfunktionen
- Versionierung von Dateien
- Nachvollziehen von Änderungen (wer, wann, warum)
- Arbeiten in verschiedenen Entwicklungszweigen (Branches)
- Paralleles Arbeiten ohne Konflikte (im Idealfall)

---

## Was ist GitHub?

GitHub ist eine Online-Plattform für Git-Repositories.

### Funktionen
- Speicherung von Repositories
- Zusammenarbeit über Pull Requests
- Aufgabenverwaltung (Issues)
- Code Reviews
- Automatisierungen (GitHub Actions)

---

## GitHub Desktop – Überblick

GitHub Desktop ist ein Tool zur Nutzung von Git ohne Kommandozeile.

### Wichtige Bereiche:
- **Current Repository**: Aktives Projekt
- **Current Branch**: Aktueller Branch
- **Changes**: Alle lokalen Änderungen
- **History**: Commit-Verlauf
- **Fetch / Pull / Push**: Synchronisation

---

## Grundstruktur von Git

### Working Directory
- Hier bearbeitest du deine Dateien

### Staging Area
- Hier sammelst du Änderungen für den nächsten Commit

### Lokales Repository
- Deine gespeicherten Commits

### Remote Repository (GitHub)
- Gemeinsame Version im Internet

---

## Standard-Arbeitsablauf in GitHub Desktop

### 1. Repository klonen (Clone)
Erstellt eine lokale Kopie eines Projekts.

**In GitHub Desktop:**
- File → Clone repository
- URL oder Auswahl aus GitHub

---

### 2. Änderungen holen (Fetch / Pull)

#### Fetch
- Prüft, ob neue Änderungen vorhanden sind
- Lädt sie aber noch nicht in deinen aktuellen Branch

#### Pull
- Holt neue Änderungen UND integriert sie

**In GitHub Desktop:**
- Button: "Fetch origin" / "Pull origin"

**Best Practice:**
➡️ Immer zuerst Pull, bevor du arbeitest

---

### 3. Änderungen machen
- Dateien im Editor bearbeiten
- GitHub Desktop erkennt Änderungen automatisch

---

### 4. Änderungen prüfen (Changes Tab)

Im "Changes"-Bereich siehst du:
- Welche Dateien geändert wurden
- Diffs (Unterschiede Zeile für Zeile)

➡️ Du kannst einzelne Dateien auswählen (Stage)

---

### 5. Commit erstellen

Ein Commit speichert deine Änderungen lokal.

**Wichtige Bestandteile:**
- Titel (kurz)
- Beschreibung (optional)

**In GitHub Desktop:**
- Summary eingeben
- Optional Beschreibung
- Button: "Commit to [Branch]"

**Best Practices:**
- Kleine, logische Änderungen committen
- Aussagekräftige Beschreibungen

---

### 6. Änderungen hochladen (Push)

Push sendet deine Commits zu GitHub.

**In GitHub Desktop:**
- "Push origin"

➡️ Erst danach sehen andere deine Änderungen

---

## Branches – Arbeiten mit Entwicklungszweigen

### Was ist ein Branch?
Ein Branch ist eine parallele Entwicklungslinie.

### Warum Branches?
- Neue Features entwickeln
- Fehler beheben
- Stabilität des Hauptzweigs schützen

---

### Branch erstellen

**In GitHub Desktop:**
- Aktuellen Branch anklicken
- "New Branch"

---

### Branch wechseln (Checkout)

Wechsel zwischen Entwicklungsständen.

➡️ Wichtig:  
Nicht uncommittete Änderungen verlieren!

---

## Merge – Zusammenführen von Branches

### Was passiert beim Merge?
Änderungen aus einem Branch werden in einen anderen übernommen.

### In GitHub Desktop:
- Button: "Choose a branch to merge into..."
- Zielbranch auswählen

---

### Merge-Konflikte

Entstehen wenn:
- dieselben Zeilen geändert wurden

### Lösung:
- Unterschiede prüfen
- gewünschte Version auswählen
- Konflikt lösen und committen

GitHub Desktop zeigt Konflikte visuell an.

---

## Pull Requests (PR)

Pull Requests sind ein zentraler Workflow in GitHub.

### Zweck:
- Änderungen prüfen lassen
- Diskussion führen
- Sicheres Mergen

### Ablauf:
1. Branch pushen
2. "Create Pull Request"
3. Änderungen vergleichen
4. Review einholen
5. Merge durchführen

---

## Weitere wichtige Funktionen in GitHub Desktop

### Änderungen verwerfen (Discard Changes)
Setzt Dateien auf den letzten Commit zurück.

⚠️ Achtung: Änderungen gehen verloren!

---

### Commit rückgängig machen (Undo / Revert)

#### Undo (lokal)
- Letzten Commit rückgängig machen

#### Revert (öffentlich)
- Neuer Commit, der Änderungen zurücknimmt

---

### History (Verlauf)

Zeigt:
- alle Commits
- Änderungen im Detail
- Autoren

**In GitHub Desktop:**
- "History"-Tab

---

### Synchronisation verstehen

| Aktion | Beschreibung |
|--------|-------------|
| Fetch | Prüft auf Änderungen |
| Pull | Holt Änderungen |
| Push | Sendet Änderungen |

---

## Typischer Workflow im Team

1. Pull (aktuellen Stand holen)
2. Neuen Branch erstellen
3. Änderungen entwickeln
4. Committen
5. Push
6. Pull Request erstellen
7. Review & Merge

---

## Best Practices

- ✅ Regelmäßig Pull durchführen
- ✅ Kleine Commits machen
- ✅ Klare Commit Messages schreiben
- ✅ Für jede Aufgabe eigenen Branch erstellen
- ✅ Konflikte früh lösen
- ✅ Pull Requests nutzen

---

## Häufige Fehler vermeiden

❌ Direkt auf main arbeiten  
❌ Große Commits mit vielen Änderungen  
❌ Nie pullen → Konflikte entstehen  
❌ Unklare Commit-Nachrichten  

---

## Ziel

Effiziente, sichere und nachvollziehbare Zusammenarbeit im Team:

- Strukturierte Entwicklung
- Weniger Konflikte
- Klare Historie
- Transparente Änderungen