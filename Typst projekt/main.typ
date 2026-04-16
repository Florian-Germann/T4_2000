#import "@preview/clean-dhbw:0.4.0": *
#import "glossary.typ": glossary-entries
#import "../ki-erklärung.typ": ki-erklaerung

#show: clean-dhbw.with(
  title: "Konzeption und Implementierung eines GitHub-basierten Branching-, Review- und Projektmanagementprozesses mit KI-gestützter Code-Compliance",
  authors: (
    (name: "Florian Germann", student-id: "7582635", course: "TEA24", course-of-studies: "Elektrotechnik", company: (
      (name: "fpt Systems GmbH", post-code: "88279", city: "Amtzell")
    ), signature: image("assets/Unterschrift.png")),
  ),
  type-of-thesis: "T4_2000",
  at-university: false, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("sources.bib"),
  date: datetime.today(),
  glossary: glossary-entries, // displays the glossary terms defined in "glossary.typ"
  language: "de", // en, de
  supervisor: (company: "Simon Würzer"),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Ravensburg Campus Friedrichshafen",
  university-short: "DHBW",
  // for more options check the package documentation (https://typst.app/universe/package/clean-dhbw)
)

// Edit this content to your liking

#ki-erklaerung


= Einleitung

Effiziente und strukturierte Quellcodeverwaltung ist zentral für moderne Softwareentwicklung. In verteilten Teams, in denen parallel an verschiedenen Komponenten gearbeitet wird, gewinnt die Organisation von Versionsständen hohe Bedeutung. Git-basierte Plattformen wie GitHub bieten hierfür leistungsfähige Lösungen.

GitHub ist eine webbasierte Plattform zur zentralen Speicherung, Verwaltung und kollaborativen Weiterentwicklung von Softwareprojekten. Durch die Git-Versionskontrolle werden Änderungen nachvollziehbar dokumentiert und frühere Stände wiederherstellbar. Dies erhöht Transparenz und Nachverfolgbarkeit in komplexen Projekten.

Ein zentrales Konzept ist der Branch. Branches sind isolierte Entwicklungszweige, mit denen neue Funktionen, Fehlerbehebungen und Experimente von der Hauptlinie getrennt durchgeführt werden können. Änderungen werden erst nach Prüfung zurückgeführt. So sind parallele Arbeiten möglich ohne gegenseitige Störungen.

Durch diese Kombination aus Versionskontrolle, klarer Nachvollziehbarkeit und parallelen Entwicklungszweigen bietet GitHub eine strukturierte Grundlage für moderne Softwareentwicklung in Teams verschiedener Größe.

Die Effektivität von GitHub ist abhängig von der Wahl einer geeigneten Branching-Strategie und dem richtigen Team Management. Branching-Regeln definieren, wie Features, Bugfixes und Releases organisiert und integriert werden. Sie sind technisch und prozessual relevant für Koordination und Qualitätssicherung.

Die Effektivität hängt jedoch nicht nur von einer geeigneten Branching-Strategie ab, sondern auch von einer strukturierten Aufgabenplanung im Team.
Spezialisierte Projektmanagement-Tools helfen dabei, Arbeitsabläufe zu strukturieren, Verantwortlichkeiten klar zuzuordnen und den Fortschritt jederzeit nachvollziehbar zu machen. Durch die enge Verzahnung mit Entwicklungsprozessen, automatisierten Workflows und übersichtlichen Boards entsteht ein gemeinsames Verständnis darüber, welche Aufgaben als Nächstes anstehen und wo mögliche Engpässe liegen. Solche Lösungen fördern nicht nur die Zusammenarbeit, sondern erhöhen auch die Qualität und Geschwindigkeit der gesamten Produktentwicklung.



= Problematik<Problematik>

==== Branching

In der Abteilung #gls("O-SW") fehlt bislang eine einheitliche und verbindliche Vorgehensweise für den Umgang mit Branches in GitHub. Obwohl die Richtlinien aus der #gls("E-SW") bereits für interne Bibliotheken und Template-Projekte übernommen wurden, zeigt sich, dass diese Vorgaben unter Umständen nicht ohne Weiteres auf die Arbeit an den Anlagen übertragbar sind. Die dortigen Entwicklungsabläufe unterscheiden sich strukturell und inhaltlich, wodurch Unklarheiten und Inkonsistenzen im praktischen Einsatz entstehen können.

Diese fehlende Passgenauigkeit führt dazu, dass Branching-Entscheidungen individuell und uneinheitlich getroffen werden. Dadurch entstehen Risiken wie unklare Versionsstände, erschwerte Nachvollziehbarkeit von Änderungen und ein erhöhtes Konfliktpotenzial beim Zusammenführen von Code. Gleichzeitig erschwert die heterogene Anwendung bestehender Richtlinien eine effiziente Zusammenarbeit innerhalb des Teams und beeinträchtigt die Qualitätssicherung im Entwicklungsprozess.

==== Management

Zum aktuellen Zeitpunkt besteht in der #gls("O-SW") die Problematik, dass keine Team-Management-Software vorhanden ist und die Release-Planung hauptsächlich über mündliche Abstimmungen und E-Mail-Ketten erfolgt. Zudem entstehen regelmäßig Schwierigkeiten, da neue Versionen von #gls("FlexOp") für die #gls("O-SW") teilweise kurzfristig auftreten und entsprechende Vorbereitungen fehlen.

==== Code-Review

Außerdem besteht trotz klar formulierter Coding-Conventions die Problematik, dass falsch benannte Variablen oder unzureichend dokumentierter Code in die Projekte gelangen. Dies ist darauf zurückzuführen, dass die Einhaltung der Richtlinien bislang nur eingeschränkt geprüft wird. Ein wesentlicher Grund dafür ist, dass für #gls("TwinCat") keine konventionellen Linter#footnote("Ein Linter prüft Code automatisch auf Fehler und Stilabweichungen.") oder vergleichbare Standardwerkzeuge verfügbar sind.

Aus diesen drei Problemfeldern ergibt sich der Bedarf nach einem einheitlichen, technisch umsetzbaren und abteilungsweit akzeptierten Lösungsansatz.

= Lösungsansatz

==== Branching

Die Abteilung #gls("E-SW") hat bereits erfolgreich Branching-Strategien etabliert. Diese Richtlinien werden in der #gls("O-SW") bereits für interne Bibliotheken und Template-Projekte genutzt und sollen im nächsten Schritt auf die Arbeit an den Anlagen erweitert werden.

Dafür werden die bestehenden Strategien systematisch auf ihre Eignung für die spezifischen Abläufe der #gls("O-SW") geprüft und zu konsistenten, unternehmensweit gültigen Richtlinien weiterentwickelt.

==== Management

Für die unzureichend strukturierten Management-Abläufe in der #gls("O-SW") existiert in der #gls("fpt Systems GmbH") bereits ein erprobter Ansatz. In der Abteilung #gls("E-SW") wird seit einiger Zeit mit der Team-Management-Software "ZenHub" gearbeitet. Sie dient dazu, anstehende Aufgaben nach Priorität zu ordnen, Teammitgliedern zuzuweisen und die Releases von #gls("FlexOp") sowie weiterer Hochsprachen-Projekte zu planen.

"ZenHub" soll daher ebenfalls in der Abteilung #gls("O-SW") eingesetzt werden, um die Weiterentwicklung der Standardbibliotheken sowie die Aktualisierung der Template-Projekte für die SPS-Programmierung zu strukturieren. Zusätzlich soll damit die Release-Koordinierung mit der #gls("E-SW") verbessert werden.

==== Code-Review

Zur Verbesserung der Code-Qualität wird ein flexiblerer Ansatz als bei klassischen Lintern verfolgt. In Abstimmung mit dem KI-Experten der #gls("E-SW") und dem für Richtlinien verantwortlichen Mitarbeiter der #gls("O-SW") Robin Hettel, wurde daher die Einführung von GitHub-Copilot-gestützten Code-Reviews vorgeschlagen. Dieser Ansatz lässt sich auf projektspezifische Anforderungen und Vorgaben anpassen und unterstützt so eine effizientere Qualitätssicherung.

==== Fazit

Um die korrekte und effiziente Nutzung dieser Verbesserungen zu gewährleisten, müssen nach der Implementierung alle Mitarbeitenden über die Änderungen in Kenntnis gesetzt und entsprechend geschult werden. Darüber hinaus sind die erarbeiteten Abläufe zentral zu dokumentieren und zugänglich zu machen, um die nachhaltige Anwendung sicherzustellen.

Alle Maßnahmen dienen der Steigerung der Arbeits- und Code-Qualität in der fpt Systems GmbH.


= Aktueller Stand der Richtlinien

== Industriestandards
In der Softwareindustrie haben sich verschiedene Branching-Standards etabliert, die seit vielen Jahren eingesetzt werden.
Im Folgenden werden die zwei bekanntesten Modelle erläutert und auf ihre Anwendbarkeit für die vorliegende Situation analysiert.

=== GitHub-Flow

#figure(image("assets/GitHub-Flow.png", width: 80%), caption: "GitHub Flow" )<GitHub-Flow>

GitHub-Flow ist ein leichtgewichtiges, kontinuierlich ausgerichtetes Branching-Modell, das speziell für Teams entwickelt wurde, die schnell und flexibel deployen möchten. Es setzt auf kurze Feature-Branches, häufige Pull Requests und automatisierte Tests, um Änderungen zügig in den Main-Branch zu integrieren. Besonders verbreitet ist GitHub-Flow in modernen DevOps-Umgebungen und Projekten, in denen kontinuierliche Auslieferung und hohe Release-Geschwindigkeit im Vordergrund stehen, wie z. B. bei Web-Apps.

#figure(table(
  columns: (1fr, 2fr),
  inset: 8pt,
  align: (left, left),
  stroke: 0.5pt + gray,
  [
    *Branch*
  ],
  [
    *Beschreibung*
  ],

  // main(master)
  [
    main(master)
  ],
  [
    Enthält fertige Releases

    Stabil - Änderungen nur aus feature/\* per PR
  ],

  // feature
  [
    feature/\*
  ],
  [
    Entwicklungsbranch für einzelne Features oder Fixes

    werden direkt von main erstellt

    nach Fertigstellung direkt PR in main
  ],
))<Tabelle-GitHub-Flow>

In @Tabelle-GitHub-Flow sind die einzelnen Branches und ihre Funktion beschrieben; @GitHub-Flow visualisiert den Ablauf ergänzend. Damit wird deutlich, dass diese Strategie insbesondere für schnelle Feature-Releases geeignet ist. Dies gilt jedoch nur unter bestimmten Rahmenbedingungen, da die Eignung stets von den spezifischen Anforderungen der Organisation abhängt.
==== Vorteile
- Schnelle Iteration
- Geringe Komplexität
- Ideal für kontinuierliche Integration
==== Nachteile
- Wenig Struktur für große Releases
- Risiko eines instabilen Main-Branches bei häufigem Mergen
==== Fazit

Zusammenfassend bietet GitHub-Flow eine einfache und agile Branching-Strategie, die sich ideal für Teams eignet, die kontinuierliche Integration und schnelle Feature-Releases priorisieren. Durch kurze Feature-Branches und direkte Merges in den Main-Branch fördert es Flexibilität und reduziert Overhead. Im Kontext der #gls("O-SW")-Abteilung, die auf strukturierte Meilenstein-Releases setzt, zeigt sich jedoch eine Schwäche: Die fehlende Isolation von Release-Vorbereitungen kann zu Instabilitäten führen und die Qualitätssicherung erschweren. Daher ist GitHub-Flow weniger geeignet als komplexere Modelle wie Git-Flow, die eine klarere Trennung von Entwicklungs- und Release-Phasen bieten.

GitHub-Flow zeigt somit Grenzen für die #gls("O-SW"). Im Folgenden wird die Alternative Git-Flow analysiert, um festzustellen, ob sie besser zum Kontext passt.

=== Git-Flow <Git-Flow>


#figure(image("assets/Gitflow-Workflow-4.png", width: 80%), caption: "Git Flow" )<Git-Flow-Grafik>

Git-Flow ist ein strukturiertes Branching-Modell für Git, das Teams hilft, Entwicklungsprozesse klar zu organisieren und gleichzeitig stabile Releases sicherzustellen. Es wurde 2010 von Vincent Driessen entwickelt und ist besonders in Projekten verbreitet, in denen mehrere Features, Hotfixes und Versionen parallel entstehen.

Das Modell umfasst mehrere langlebige Branches mit klar definierten Regeln.
In @Git-Flow-Grafik wird dargestellt, wie sich diese Branches zueinander verhalten und in welchen Branches tatsächlich entwickelt wird. Ergänzend werden in @tabelle-Git-Flow die einzelnen Branches beziehungsweise Branch-Gruppen beschrieben.

#figure(table(
  columns: (1fr, 2fr),
  inset: 8pt,
  align: (left, left),
  stroke: 0.5pt + gray,
  [
    *Branch*
  ],
  [
    *Beschreibung*
  ],

  // main(master)
  [
    main(master)
  ],
  [
    Enthält fertige Releases

    Stabil - Änderungen nur aus release/\* per PR

    Änderungen in main müssen zurück in develop fließen.
  ],

  // develop
  [
    develop
  ],
  [
    Grundlage aller Entwicklungsbranches

    Stabil - Änderungen nur als PR
  ],

  // feature
  [
    feature \/ \* 
  ],
  [
    Entwicklungsbranches neuer Features  
    
    In diesen wird gearbeitet

    Strukturierung über Subbranches möglich
  ],

  // bugfix
  [
    bugfix \/ \* 
  ],
  [
    Entwicklungsbranch für Bugfixes

    Wird von develop abgespalten um Bugs zu entfernen
  ],

  // release
  [
    release \/ \* 
  ],
  [
    Vorbereitung für den Release

    Wird von develop abgespalten

    Änderungen fließen wieder in develop

    z. B. Erstellung von Release Notes
  ],

  // hotfix
  [
    hotfix \/ \* 
  ],
  [
    Hotfix von main

    Änderungen fließen auch in develop
  ],
))<tabelle-Git-Flow>

Dieses System eignet sich hervorragend für strukturierte Abläufe mit klar definierten, umfassenden und sequenziellen Releases. Es ist jedoch weniger geeignet für die Entwicklung von "Rolling Releases", da die Zeitspanne bis zur Veröffentlichung zu lang ist. Da die Projekte in der #gls("O-SW") Releases nur an Projektmeilensteinen vorsehen, ist dieses System am besten geeignet.

== Richtlinien E-SW<E-SW-Richtlinien>


#figure(image("assets/Git-Flow-E-SW.png", width: 90%), caption: "Git Flow E-SW" )<Git-Flow-E-SW>

Zu Beginn wurde von Ralf Scheyerle, der für die Richtlinien bei #gls("E-SW") verantwortlich ist, der aktuelle Stand angefordert. Da das Team aus lediglich fünf Personen besteht, waren die Vorgaben überwiegend mündlich dokumentiert und nur in einem einfachen Word-Dokument festgehalten.

In @Git-Flow-E-SW, das diesem Word-Dokument entnommen ist, zeigt sich, dass die aktuelle Strategie der #gls("E-SW") den in @Git-Flow beschriebenen Git-Flow-Prinzipien weitgehend entspricht. Der wesentliche Unterschied, wie in @tabelle-E-SW näher beschrieben, besteht darin, dass Releases nicht in separaten release/\*-Branches vorbereitet, sondern in main durchgeführt und anschließend über einen release/\*-Branch veröffentlicht werden. Dies ermöglicht einen schnellen Zugriff auf den Code-Stand früherer Releases, ohne in Tags oder Pull Requests nach Versionsnummern suchen zu müssen. Nachteilig ist jedoch, dass sich langfristig ein großes Volumen inaktiver Branches ansammelt und dadurch die Übersichtlichkeit sinkt.

#figure(table(
  columns: (1fr, 2fr),
  inset: 8pt,
  align: (left, left),
  stroke: 0.5pt + gray,
  [
    *Branch*
  ],
  [
    *Beschreibung*
  ],

  // main
  [
    main
  ],
  [
    Für Releasevorbereitung  

    Stabil - Änderungen nur aus "develop" per PR  

    Änderungen in main müssen zurück in develop fließen.
  ],

  // develop
  [
    develop
  ],
  [
    Grundlage aller Entwicklungsbranches 

    Stabil - Änderungen nur als PR
  ],

  // feature
  [
    feature \/ \* 
  ],
  [
    Entwicklungsbranch neuer Features 

    Verknüpfung mit ZenHub Epics über ID möglich  

    Beispiel:  
    feature/Fx.FlexOP-1640_SSI-Packagerstellung  

    SubFeature (Task-Ebene):  
    feature/Fx.FlexOP-1640_SSI-Packagerstellung/FPT.SSI-51_Externe-Steuerungsconfig
  ],

  // bugfix
  [
    bugfix \/ \* 
  ],
  [
    Entwicklungsbranch für Bugfixes

    Verknüpfung mit ZenHub Bugs über ID möglich  

    Beispiel:  
    bugfix/Fx.FlexOP-1234
  ],

  // release
  [
    release \/ \* 
  ],
  [
    Releases von main  

    Kann auch über Tag gelöst werden, sollte aber als Branch gezogen werden, sobald ein Hotfix nötig wird.  

    Beispiel:  
    release/Fx.FlexOP_v4.5.5.x
  ],

  // hotfix
  [
    hotfix \/ \* 
  ],
  [
    Hotfix von Release-Branch  

    Sollte wieder zurück in develop fließen 

    Verknüpfung mit ZenHub Bug über ID  

    Beispiel:  
    hotfix/Fx.FlexOP_v4.5.5.12_2547
  ],
))<tabelle-E-SW>

Dieses Word-Dokument enthält in @Git-Flow-E-SW und @tabelle-E-SW die Kernelemente einer angepassten Git-Flow-Strategie. Die Strategie unterscheidet sich dadurch, dass Releases nicht in separaten release/\*-Branches vorbereitet werden, sondern in main, und dann über einen release/\*-Branch veröffentlicht werden.
Die übrigen Vor- und Nachteile entsprechen denen aus @Git-Flow.

== Fazit

Auf Basis von Gesprächen mit Robin Hettel wurde festgestellt, dass die Implementierung von Git-Flow sowohl zweckmäßig als auch gewünscht ist. Dies liegt daran, dass Git-Flow für wenige, größere Releases besser geeignet ist als GitHub-Flow. Darüber hinaus ist der in @E-SW-Richtlinien genannte Vorteil für den vorliegenden Kontext weniger relevant, da Releases ausschließlich an Projektmeilensteinen erfolgen und der aktuelle Code-Stand somit die primäre Anforderung darstellt.


= Prüfung der Coding-Conventions


GitHub Copilot kann weit mehr als nur Code vervollständigen: Das System unterstützt Entwickler auch dabei, bestehende Coding-Conventions automatisiert zu berücksichtigen. Während des Schreibens analysiert Copilot den Kontext, erkennt typische Muster und orientiert sich an projektinternen Standards. Dadurch entstehen Vorschläge, die nicht nur funktional, sondern auch stilistisch konsistent sind. Teams profitieren so von einer gleichmäßig hohen Codequalität, weniger manuellen Korrekturen und einem deutlich effizienteren Review-Prozess.

== Aktueller Stand bei fpt

Bei fpt befindet sich der Einsatz von Copilot für Code-Reviews aktuell noch in der Erprobungsphase. Hierfür wurde ein separates Test-Repository erstellt, um keine kritischen Bereiche zu beeinflussen. Da Copilot bei Reviews nur auf das jeweilige Repository zugreifen kann, müssen die Coding-Conventions im .github-Ordner hinterlegt werden. Dies erfolgt über .md-Dateien, die GitHub nativ in gerenderter Form anzeigt. Um sicherzustellen, dass alle Repositories konsistent aktualisiert werden und Änderungen nicht manuell organisationsweit verteilt werden müssen, wurde das in @CodingConventionDiagramm dargestellte System implementiert. Jeder Block repräsentiert ein Repository, die Pfeile symbolisieren GitHub Actions.

Bei Änderungen der Coding-Conventions wird im Übersichts-Repository eine GitHub-Aktion ausgeführt, die die aktuellen .md-Dateien an Bibliotheken und Template-Projekte verteilt. Da in den Aktionen die Ziel-Repositories explizit angegeben werden müssen, lassen sich Projekt-Repositories auf diesem Weg nicht direkt anpassen, weil diese fortlaufend neu erstellt werden. Stattdessen werden im Template-Projekt Aktionen hinterlegt, die in allen abgeleiteten Projekten verfügbar sind und die aktuellen Conventions aus dem Übersichts-Repository abrufen. Auf diese Weise sind die aktuellen Conventions in allen relevanten Repositories verfügbar.


#figure(image("assets/CodingConventionFlow.png", width: 90%), caption: "Coding-Convention Verteilung" )<CodingConventionDiagramm>

Diese Aktionen sind bereits in allen #gls("O-SW")-Repositories vorhanden, die keine Projekt-Repositories sind. Diese wurden intensiv auf Fehler getestet. Auch die Funktion, dass neue Projekte diese Aktionen automatisch erhalten, ist bereits implementiert.


Des Weiteren wurde im Test-Repository bereits implementiert, dass Copilot bei jeder Pull Request auf main automatisch alle Commits hinsichtlich der Coding-Conventions prüft und entsprechende Verbesserungsvorschläge liefert. Zur Überprüfung der Zuverlässigkeit dieser Funktion wurden bewusst Fehler eingebaut. Aus den resultierenden Copilot-Antworten auf die Pull Requests konnten mehrere Problemfelder abgeleitet werden.
Diese sollen im Folgenden aufgelistet, erläutert und potenziell gelöst werden.


== Testablauf

Zur Evaluierung der Zuverlässigkeit von GitHub Copilot wurde im Test-Repository ein separater Branch angelegt, in den gezielt Fehler eingebaut wurden. Diese repräsentieren häufig auftretende Programmierfehler und dienen der Identifikation typischer Schwachstellen. Anschließend wurde jeweils ein Pull Request in main erstellt, um die konfigurierte Code-Review-Richtlinie zu aktivieren. Copilot analysierte daraufhin die Änderungen und verfasste entsprechende Kommentare zum Pull Request.

Da Copilot die Pull-Request-Beschreibung und weitere Kommentare verarbeitet, wurde die Checkliste mit den absichtlich eingebauten Fehlern jeweils erst nach dem Review ergänzt, um den Entwicklungsverlauf nachvollziehbar zu dokumentieren.

Wenn Änderungen an den Coding-Conventions oder Copilot-Anweisungen vorgenommen wurden, wurde der vorherige Pull Request geschlossen und ein neuer erstellt, um eine kontrollierte und vergleichbare Testumgebung zu gewährleisten.


== Probleme und potenzielle Lösungen

==== Grundproblem

In den Code-Reviews durch Copilot zeigte sich zunächst, dass die Gründlichkeit nicht ausreichte. Nach Recherchen und Konsultation von GitHub Copilot Chat wurde deutlich, dass die Coding-Conventions vermutlich nicht präzise genug formuliert waren. Deshalb wurden die vollständigen Kapitel "#gls("TwinCat")" und "Allgemein" überarbeitet. Hierzu wurde der Microsoft-Copilot-Agent "Prompt Coach" eingesetzt, um die Regeln unter Berücksichtigung des vorhandenen Kontexts KI-kompatibler zu formulieren. Die Überarbeitung umfasste vor allem eine sprachliche Präzisierung sowie die Ergänzung separater Copilot-Anweisungen.

Die durch die KI generierten Vorschläge wurden von mehreren Personen inhaltlich geprüft und nur nach sorgfältiger Bewertung übernommen. Eine ungeprüfte oder automatische Übernahme der KI-Ausgaben erfolgte nicht.

Zusätzlich wurde jeder Regel eine eindeutige ID zugeordnet, die von GitHub Copilot referenziert werden kann. Die Struktur folgt dem Muster Kapitelnummer-Fehlernummer im Kapitel, zum Beispiel "3.2.7-2".

Nach diesen Anpassungen verbesserte sich die Qualität der Reviews deutlich. Dies zeigte sich daran, dass die Referenzierung von Kapiteln beziehungsweise Regel-IDs konsistent funktionierte und identifizierte Probleme zumindest als unterdrückte Kommentare erschienen.

==== Problem Kommentarunterdrückung

Das zentrale Restproblem bestand darin, dass Copilot Benennungsregelverstöße für Variablentypen innerhalb von Structs nur eingeschränkt zuverlässig erkannte. Insbesondere die Prüfung des Präfixes stc\_ für Struct-Typ-Variablen war betroffen. In der Praxis äußerte sich dies so, dass Verstöße zwar erkannt, die zugehörigen Kommentare jedoch unterdrückt wurden. Das Problem wurde reproduziert, indem im Testcode gezielt das erforderliche Präfix bei einem Variablentyp in einer Struct entfernt wurde. Zur Lösung wurden die relevanten Auszüge aus den Coding-Conventions in @VariableNaming in den Kontextdialog übernommen. Nach Beschreibung des konkreten Problems wurde der Zusatz für die Coding-Conventions erstellt, der in @structKlausel dargestellt ist.

#figure(image("assets\Vorgaben-Variablen.png", width: 90%), caption: "Coding-Convention Variablen Präfixe" )<VariableNaming>

#figure(caption: "Klausel",
sourcecode(```md
### Zusatz: Referenzierung der Datentyp-Präfixe bei Benennungsverstößen (Mandatory)

Bei Benennungsverstößen, die Datentyp-Präfixe betreffen,
MUSS als fachliche Grundlage **Tabelle 3.2.5 (Datentyp-Präfixe)** herangezogen werden.

Befunde MÜSSEN:
- das **konkret erwartete Präfix** nennen (z.B. `b_`, `i_`, `di_`)
- optional explizit auf **Tabelle 3.2.5** verweisen

Befunde DÜRFEN NICHT:
- Datentypen semantisch interpretieren (z.B. „BOOL-Präfix“)
- implizite Ableitungen ohne Tabellenreferenz enthalten

Zulässig:
- „Feldname beginnt nicht mit dem erwarteten Präfix `b_` gemäß Tabelle 3.2.5.“
- „Bezeichner beginnt nicht mit dem erforderlichen Präfix `e_` (siehe Tabelle 3.2.5).“
```))<structKlausel>

Nach dieser Änderung erkannte GitHub Copilot die Regelverstöße zuverlässig. Allerdings erschienen die Hinweise weiterhin als "suppressed due to uncertainty". Zur Analyse wurde die GitHub-Copilot-Funktion "Agents" genutzt. Diese kann das gesamte Repository einschließlich früherer Pull Requests als Kontext einbeziehen und liefert dadurch fundiertere Analysen.
Die Auswertung zeigte, dass die Kommentare von GitHub selbst unterdrückt wurden, weil sie eine umbenannte Datei referenzierten. Da Git-Umbenennungen in Diffs häufig als Löschen und Neu-Anlegen dargestellt werden, stuft GitHub solche Befunde schneller als unsicher ein, weil:
- Die gesamte Datei als „neu hinzugefügt" erscheint
- GitHub keine stabile Diff-Kontext-Verknüpfung für umbenannte Dateien aufbauen kann
- Das Umbenennen an sich als intentionale Änderung gilt. Copilot widerspricht dem PR-Intent
Daraus folgt: Copilot erkennt den Verstoß korrekt, GitHub unterdrückt den Kommentar jedoch im Anschluss.

Die durch die Agent gelieferten Analysen wurden manuell überprüft und mit den tatsächlichen Repository-Änderungen abgeglichen, um Fehlinterpretationen auszuschließen.

Als Gegenmaßnahme schlug der Agent vor, die in @Klausel gezeigte Anweisung in die GitHub-Copilot-Instruktionen aufzunehmen.

#figure(caption: "Anti suppression Klausel",
sourcecode(```md
### Pflicht-Strategie für Violations in umbenannten DUT-Dateien (Mandatory)

**3.2.12-2 (Mandatory Review Behavior)**

Wenn ein STRUCT- oder ENUM-Typ in einer **umbenannten** DUT-Datei deklariert wird
(erkennbar daran, dass der alte Dateiname und der neue Dateiname im `.plcproj`-Diff
sichtbar sind), MUSS Copilot den Typ-Benennungsverstoß auf **zwei** Arten melden:

1. An der Verwendungsstelle in einer **nicht umbenannten, modifizierten Datei**
   (z.B. `stc_FxControlPar.TcDUT`, `FxGroupManagement_V12.TcPOU`), sofern der
   Typ dort als neue Version des umbenannten Typs referenziert wird.
   Die Evidence MUSS die Zeile enthalten, die den Typnamen ohne korrektes Präfix zeigt.
   Der Befund MUSS explizit darauf hinweisen, dass die TYPE-Deklaration selbst verletzt ist.

2. In der `.plcproj`-Datei an der Zeile, die den neuen (prefix-losen) DUT-Dateinamen
   enthält - sofern diese Zeile im Diff als geänderter `+`-Eintrag erscheint.

**Copilot DARF NICHT** als einzigen Fundort die umbenannte DUT-Datei selbst angeben,
da GitHub diese Kommentare als low-confidence unterdrückt.
```))<Klausel>

Damit werden Verstöße nicht nur an der Deklaration, sondern zusätzlich an der ersten Verwendung in einer nicht umbenannten Datei gemeldet. Dadurch sinkt die Wahrscheinlichkeit einer Unterdrückung durch GitHub.
Nach dem Testen dieses Vorschlags wurden die ursprünglichen Kommentare zwar weiterhin teilweise unterdrückt, die Verstöße erschienen jedoch zusätzlich an der ersten Verwendung der betroffenen Variable als Fehler. Da diese Fundstellen nicht in umbenannten Dateien lagen, wurden die entsprechenden Meldungen nicht unterdrückt.


== Feedback und andere Verbesserung

Nachdem die Verbesserungen auf dem Test-Repository implementiert wurden, fand ein Gespräch mit Ralf Scheyerle statt, welcher die Änderungen prüfte. 
Hierbei merkte er einige Dinge an den Instructions an. Zum einen seien sie ziemlich eng formuliert, sodass der Copilot nur als Reviewer funktionieren kann, was die Nutzung von ihm als Coding Agent in der Zukunft erschweren würde. Da diese Funktion ein großer Teil der effektiven Nutzung von KI ausmacht, empfiel er hier, die Anweisungen abzuändern, um diese Möglichkeit zu erhalten. Hierbei muss aber eine Balance gefunden werden, zwischen Freiheit und richtiger Funktion des Modells.

Im Nachgang dieses Gesprächs wurden zum einen die Instructions so überarbeitet, dass sie den Copilot nichtmehr zu stark einschränken. Dies Bestand daraus, dass die Klausel, welche das Verhalten auf reines Reviewen beschränkten, entfernt wurde. Desweiteren wurden die überarbeiteten TwinCat-Instructions in das Übersicht-Repository eingearbeitet. Somit kann nun der Ablauf aus @CodingConventionDiagramm verwendet werden, um die Coding-Conventions un Copilot-Intructions zu verteilen.





= Testen Branching und Code-Review

Um die praxisnahe Integration der Code-Quality-Assurance-Protokolle zu bewerten, wurden diese in ein Projekt eingebracht, das sich noch in der Vorinbetriebnahme befand. Hierfür wurde mit den Projektprogrammierern David Kromer und Alexandru Trusi ein Termin geplant, in dem die zu implementierenden Methoden besprochen wurden. Insbesondere die Branching-Strategien erhielten positives Feedback, da beide Programmierer die in @Problematik beschriebenen Herausforderungen bereits aus der Praxis kannten.

Alexandru brachte zudem den Vorschlag ein, ergänzend zu Feature-Branches pro Entwickler einen eigenen Develop-Branch zu verwenden. Darin kann zunächst unabhängig gearbeitet werden, bevor stabile Zwischenstände per Pull Request in develop überführt werden.
Zusätzlich können nutzerspezifische Feature-Branches für die Umsetzung konkreter Funktionen eingesetzt werden.
Die Benennung dieser Branches könnte beispielsweise wie folgt lauten:
- user/develop
- user/feature/NeuesFeature

Beide Programmierer signalisierten außerdem Offenheit gegenüber Copilot, sofern die Reviews konsistent und verlässlich arbeiten.


Bei einer Abstimmung mit Robin Hettel zu den Ergebnissen dieses Meetings merkte dieser an, dass man anstatt von Nutzereigenen Branches eher Bereiche der Anlage als eigenen Branch anlegen sollte. Dies soll den Nutzen haben, dass sich Programmierer Bereiche "reservieren" können, um ungestört an diesen zu Arbeiten. Das würde außerdem dazu beitragen, dass man nicht, nur für Anlagenprogrammierung, eigene Richtlinien formulieren muss, sondern einen Unternehmensweiten Standart nutzen kann.


== Umsetzung
=== Branching Strategien

Die Branching-Strategie wurde auf Basis des angepassten Git-Flow-Modells umgesetzt. Dabei wurden die Verantwortlichkeiten der Branches klar definiert und der Merge-Prozess über Pull Requests standardisiert. Ergänzend wurden Benennungsregeln für Feature-, Bugfix- und Release-Branches festgelegt, um Nachvollziehbarkeit und einheitliche Abläufe sicherzustellen.

=== Copilot Code-Review

Das Copilot-gestützte Code-Review wurde analog zum Test-Repository in den Projektkontext überführt. Dabei werden Pull Requests auf main automatisch gegen die hinterlegten Coding-Conventions geprüft. Die Ergebnisse fließen als strukturierte Review-Kommentare in den Freigabeprozess ein und unterstützen die frühzeitige Erkennung von Abweichungen.

Das Code-Review wird bei jedem Pull Request auf main ausgelöst, um die Einhaltung der Coding-Conventions systematisch zu prüfen.


= Implementierung ZenHub

= Fazit
