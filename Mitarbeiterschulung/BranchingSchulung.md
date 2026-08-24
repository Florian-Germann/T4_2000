# Arbeiten mit GitFlow Branching-Strategien

## Einführung

Eine einheitliche Branching-Strategie ist eine zentrale Voraussetzung für strukturierte und nachvollziehbare Zusammenarbeit in Softwareprojekten.
Sie legt fest, auf welchen Branches entwickelt wird, wie Änderungen geprüft werden und wann Code in einen stabilen Stand überführt werden darf.

Für die Arbeit in der O-SW wird ein an GitFlow angelehntes Vorgehen genutzt.
Dieses Modell eignet sich besonders für Projekte mit klaren Meilensteinen, geplanten Releases und mehreren parallel laufenden Entwicklungsaufgaben.

---

## Was ist GitFlow?

GitFlow ist ein Branching-Modell für Git, das die Entwicklung in klar definierte Branch-Typen unterteilt.

### Ziel von GitFlow
- Strukturierte Entwicklung ermöglichen
- Stabile Release-Stände absichern
- Paralleles Arbeiten an Features und Fehlerbehebungen vereinfachen
- Änderungen kontrolliert über Pull Requests zusammenführen

---

## Die wichtigsten Branches

### `main`
- Enthält den stabilen beziehungsweise freigegebenen Stand
- Änderungen erfolgen nicht direkt, sondern nur über Pull Requests
- Dient als Grundlage für Releases oder Release-Vorbereitung

### `develop`
- Zentraler Integrationsbranch für die laufende Entwicklung
- Von hier werden neue Entwicklungsbranches erstellt
- Änderungen werden per Pull Request zurückgeführt

### `feature/*`
- Für neue Funktionen oder Erweiterungen
- Werden in der Regel von `develop` erstellt
- Nach Fertigstellung per Pull Request zurück in `develop`

### `bugfix/*`
- Für Fehlerbehebungen innerhalb der laufenden Entwicklung
- Werden von `develop` erstellt
- Nach Prüfung per Pull Request zurück in `develop`

### `release/*`
- Für einen konkreten Release-Stand
- Dient dazu, einen freigegebenen Stand eindeutig festzuhalten
- Kann als Ausgangspunkt für spätere Hotfixes genutzt werden

### `hotfix/*`
- Für dringende Fehlerbehebungen auf einem bereits freigegebenen Stand
- Wird vom betroffenen Release-Stand abgeleitet
- Änderungen müssen nach der Korrektur auch wieder in `develop` zurückfließen

---

## Benennung der Branches

Eine klare Benennung verbessert die Nachvollziehbarkeit und erleichtert die Zuordnung zu Aufgaben oder Fehlern.

### Empfohlene Muster
- `feature/<Thema>`
Alternativ kann auch anstatt eines Themas der Name des Entwicklers verwendet werden

- `bugfix/<Thema>`
- `release/<Version>`
- `hotfix/<Version_oder_Ticket>`

### Beispiele aus dem Projektumfeld
- `feature/Gebindefördertechnik`

### Best Practices für Namen
- Branch-Namen kurz, aber eindeutig halten
- Ticket- oder Epic-IDs einbauen, wenn vorhanden
- Leerzeichen vermeiden
- Einheitliche Schreibweise im Team verwenden

---

## Typischer Workflow im Team

1. Aktuellen Stand von `develop` oder dem vorgesehenen Zielbranch holen
2. Passenden Branch für die Aufgabe erstellen
3. Änderungen umsetzen und regelmäßig committen
4. Branch auf den Remote-Stand pushen
5. Pull Request erstellen
6. Review durchführen lassen
7. Branch nach Freigabe in den Zielbranch mergen

---

## Standardabläufe nach Branch-Typ

### Arbeiten an einem Feature
1. Von `develop` einen `feature/*`-Branch erstellen
2. Änderung entwickeln und lokal testen
3. Commits erstellen und Branch pushen
4. Pull Request nach `develop` öffnen
5. Review und Merge durchführen

### Arbeiten an einem Bugfix
1. Von `develop` einen `bugfix/*`-Branch erstellen
2. Fehler beheben und Änderung prüfen
3. Pull Request nach `develop` öffnen
4. Nach Review mergen

### Umgang mit Releases
1. Entwicklungsstand in `develop` fachlich abschließen
2. Freigabefähigen Stand nach `main` überführen
3. Für die veröffentlichte Version einen `release/*`-Branch anlegen
4. Release-Branch als Referenz für spätere Hotfixes beibehalten

### Umgang mit Hotfixes
1. Hotfix von einem bestehenden `release/*`-Branch ableiten
2. Fehler gezielt beheben
3. Änderung freigeben und in den betroffenen stabilen Stand übernehmen
4. Die Korrektur zusätzlich wieder in `develop` zurückführen

---

## Pull Requests im GitFlow-Prozess

Pull Requests sind verbindlicher Bestandteil des Branching-Prozesses.
Sie sorgen dafür, dass Änderungen nicht ungeprüft in stabile Branches übernommen werden.

### Zweck von Pull Requests
- Änderungen fachlich und technisch prüfen
- Coding-Conventions kontrollieren
- Diskussionen und Rückfragen dokumentieren
- Merge-Vorgänge nachvollziehbar machen

### Grundregel
- Keine direkte Arbeit auf `main`
- Keine direkte Arbeit auf `develop`, wenn die Aufgabe in einem eigenen Branch bearbeitet werden kann
- Änderungen werden grundsätzlich über Pull Requests integriert

---

## Vorteile der Strategie

- Klare Trennung zwischen Entwicklung und stabilem Stand
- Paralleles Arbeiten an mehreren Themen möglich
- Höhere Nachvollziehbarkeit im Projektverlauf
- Releases und Hotfixes lassen sich sauber dokumentieren
- Pull-Request-basierte Qualitätssicherung wird unterstützt

---

## Typische Fehler vermeiden

❌ Direkt auf `main` arbeiten  
❌ Feature- und Bugfix-Änderungen ohne eigenen Branch umsetzen  
❌ Änderungen ohne Pull Request mergen  
❌ Hotfixes nur im Release-Stand korrigieren, aber nicht nach `develop` zurückführen  
❌ Uneinheitliche oder nichtssagende Branch-Namen verwenden  

---

## Best Practices

- Für jede Aufgabe einen eigenen Branch verwenden
- Branches möglichst thematisch sauber trennen
- Regelmäßig mit dem Zielbranch synchronisieren
- Kleine und nachvollziehbare Commits erstellen
- Pull Requests nicht zu groß werden lassen
- Branch-Namen mit Ticket- oder Epic-Bezug versehen
- Nach dem Merge nicht mehr benötigte Branches bereinigen

---

## Ziel

GitFlow schafft einen einheitlichen und kontrollierten Ablauf für Entwicklung, Review und Freigabe.
Im Team führt das zu:

- besserer Nachvollziehbarkeit
- weniger Konflikten beim Zusammenführen von Änderungen
- stabileren Release-Ständen
- klareren Verantwortlichkeiten im Entwicklungsprozess
