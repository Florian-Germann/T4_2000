#import "@preview/clean-dhbw:0.4.0": *
#import "glossary.typ": glossary-entries
#import "chapters/ki-erklärung.typ": ki-erklaerung

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

Strukturierte Quellcodeverwaltung ist eine Grundvoraussetzung für moderne Softwareentwicklung in verteilten Teams. In solchen Umgebungen muss jederzeit dokumentiert sein, welche Änderungen wann und von wem durchgeführt wurden. Git-basierte Plattformen wie GitHub bieten dafür eine etablierte Lösung.

GitHub ermöglicht zentrale Ablage und gemeinsame Weiterentwicklung von Projekten. Durch die Git-Versionskontrolle lassen sich Änderungen transparent dokumentieren und frühere Zustände reproduzieren. Dies steigert in komplexen Projekten die Nachvollziehbarkeit und reduziert Abstimmungsaufwand erheblich.

Branches sind ein zentrales Konzept dieser Versionskontrolle. Sie ermöglichen es, neue Funktionen, Fehlerbehebungen oder Experimente isoliert umzusetzen. Nach Prüfung und Freigabe fließen diese Änderungen in die Hauptentwicklungslinie zurück. So arbeiten mehrere Personen parallel, ohne sich gegenseitig zu behindern.

Die Kombinierung aus Versionskontrolle, nachvollziehbarer Historie und parallelen Entwicklungszweigen schafft eine robuste Grundlage für Teamarbeit.

In der Praxis hängt die Effektivität von GitHub stark von gewählten Prozessen ab. Insbesondere prägen zwei Faktoren den Erfolg: erstens eine passende Branching-Strategie, zweitens funktionierendes Team-Management. Diese definieren, wie Features, Bugfixes und Releases vorbereitet und integriert werden - nicht nur technisch, sondern auch organisatorisch.

Eine gute Branching-Strategie allein genügt jedoch nicht. Ergänzend erforderlich ist strukturierte Aufgabenplanung im Team. Projektmanagement-Werkzeuge unterstützen dabei durch: transparente Priorisierung von Arbeitspaketen, klare Verantwortlichkeitszuweisung und sichtbare Fortschrittsverfolgung. Die Verzahnung mit Entwicklungsprozessen, automatisierten Workflows und übersichtlichen Boards schafft gemeinsames Verständnis für anstehende Aufgaben und potenzielle Engpässe. Dies fördert Zusammenarbeit und steigert Qualität sowie Implementierungsgeschwindigkeit.


Zur didaktisch klaren Einordnung folgt die Arbeit der Abfolge Ausgangslage, konzeptioneller Lösungsansatz, fachliche Grundlagen, Evaluation im Testkontext, Pilotierung im Projekt, organisatorische Implementierung und Schulung sowie abschließendes Fazit.


= Ausgangslage und Zielbild

== Problematik<Problematik>

=== Branching<ProblematikBranching>

In der Abteilung #gls("O-SW") existiert bislang keine verbindliche und einheitliche Vorgehensweise für GitHub-Branches. Obwohl die #gls("E-SW") Richtlinien bereits bei internen Bibliotheken und Template-Projekten eingesetzt werden, zeigt sich in der Praxis: Diese Vorgaben passen nicht auf die Anlagenentwicklung. Die Entwicklungsabfläufe unterscheiden sich strukturell und inhaltlich, was zu alltags prägenden Unklarheiten führt.

Ohne diese Passgenauigkeit treffen Entwickler Branching-Entscheidungen zunehmend individuell. Das führt zu uneinheitlichen Abfällen, erschwert die Nachvollziehbarkeit von Änderungen und erhöht das Konfliktrisiko beim Zusammenführen von Code. Gleichzeitig sinkt die Zusammenarbeitseffizienz, da gemeinsame Regeln keine durchgehende Anwendung finden.

=== Management

Im Bereich Management nutzt die #gls("O-SW") derzeit keine dedizierte Team-Management-Software. Die Release-Planung erfolgt vornehmlich über mündliche Absprachen und E-Mail-Verteiler. Dies ist in der Praxis fehleranfällig und nur begrenzt transparent. Zusätzlich entstehen Engpässe, wenn neue #gls("FlexOp")-Versionen verbreitet werden und notwendige Vorbereitung nicht rechtzeitig anläuft.

=== Code-Review

Bei der Codequalität zeigt sich trotz formulierter Coding-Conventions ein wiederkehrendes Problem: Falsch benannte Variablen und unzureichend dokumentierte Code-Passagen gelangen in Projekte. Die Ursache liegt darin, dass die Regelkontrolle bisher nur begrenzt und überwiegend manuell stattfindet. Für #gls("TwinCat") fehlen klassische Linter-Werkzeuge oder vergleichbare Lösungen, so dass automatisierte Qualitätssicherung deutlich erschwert ist.

=== Entwicklungsumgebung

In der #gls("O-SW") besteht das Problem fehlender Entwicklungsumgebung-Einheit. Die Ursache: Lizenzen der bisherigen Lösung sind abgelaufen; kostengründe und lange Update-Zyklen machen Neuentwicklung erforderlich. Aktuell existiert kein etabliertes Nachfolgesystem.

Aus diesen vier Problemfeldern ergibt sich der Bedarf nach einem gemeinsamen, technisch umsetzbaren und von der gesamten Abteilung getragenen Lösungsansatz.

== Lösungsansatz

=== Branching

In der #gls("E-SW") sind bereits funktionierende Branching-Strategien etabliert. Diese werden in der #gls("O-SW") heute schon bei internen Bibliotheken und Template-Projekten eingesetzt und sollen im nächsten Schritt auf die Anlagenentwicklung ausgeweitet werden.

Dazu werden die bestehenden Regeln systematisch darauf geprüft, inwieweit sie zu den spezifischen Abläufen der #gls("O-SW") passen. Ziel ist eine konsistente Richtlinie, die fachlich tragfähig ist und unternehmensweit einheitlich angewendet werden kann.

=== Management

Für die aktuell wenig strukturierten Management-Abläufe in der #gls("O-SW") liegt innerhalb der #gls("fpt Systems GmbH") bereits ein erprobter Lösungsweg vor: In der #gls("E-SW") wird seit einiger Zeit die Team-Management-Software ZenHub genutzt. Damit werden Aufgaben priorisiert, Teammitgliedern zugewiesen und Releases von #gls("FlexOp") sowie weiteren Hochsprachen-Projekten geplant.

ZenHub soll deshalb auch in der #gls("O-SW") eingeführt werden. Ziel ist es, die Weiterentwicklung der Standardbibliotheken und die Pflege der Template-Projekte für die SPS-Programmierung besser zu strukturieren. Gleichzeitig soll die Release-Abstimmung mit der #gls("E-SW") verlässlicher werden.

=== Code-Review

Zur Verbesserung der Code-Qualität wird ein flexibler Ansatz verfolgt, der klassische Linter ergänzt beziehungsweise in Teilbereichen ersetzt. In Abstimmung mit dem KI-Experten der #gls("E-SW") Ralf Scheyerle und dem in der #gls("O-SW") für Richtlinien verantwortlichen Mitarbeiter Robin Hettel wurde daher die Einführung von GitHub-Copilot-gestützten Code-Reviews vorgeschlagen. Dieser Ansatz lässt sich an projektspezifische Anforderungen anpassen und unterstützt eine effizientere Qualitätssicherung.

=== Entwicklungsumgebung

Um in der #gls("O-SW") wieder nahtlos entwickeln zu können, wird derzeit eine neue Umgebung aufgebaut. Bisher kamen Visual Studio 2017 in Kombination mit dem Windows Explorer, GitHub Desktop oder Sourcetree sowie ein in Visual Studio integriertes Werkzeug für KUKA-Steuerungen zum Einsatz. Das firmeneigene integrierte Werkzeug FlexManager ist jedoch veraltet und kann nicht auf neuere Visual-Studio-Versionen aktualisiert werden. Da deshalb ohnehin eine Neuentwicklung erforderlich wäre und die Visual-Studio-Lizenzen auslaufen, wurde die Konzeption einer neuen Entwicklungsumgebung beschlossen. Die Entscheidung fiel auf Visual Studio Code in Kombination mit der TwinCat XAE Shell, da sich VS Code durch Extensions bedarfsgerecht erweitern lässt.

== Teilfazit Ausgangslage und Zielbild

*Erkenntnis:* Die identifizierten Problemfelder lassen sich nur durch ein abgestimmtes Maßnahmenbündel aus Branching-Regeln, Managementprozess, Review-Methodik und geeigneter Entwicklungsumgebung adressieren.

*Implikation:* Damit die eingeführten Verbesserungen im Alltag zuverlässig funktionieren, müssen alle Mitarbeitenden nach der Implementierung informiert und entsprechend geschult werden. Zusätzlich ist eine zentrale, leicht zugängliche Dokumentation der neuen Abläufe notwendig, damit die Anwendung langfristig konsistent bleibt.

*Übergang:* Vor diesem Hintergrund werden im folgenden Kapitel die fachlichen Grundlagen und Referenzmodelle systematisch eingeordnet.


= Grundlagen und Ausgangslage

== Industriestandards für Versionskontrolle

In der Softwareentwicklung haben sich mehrere Branching-Muster etabliert. Die folgenden zwei Modelle sind am weitesten verbreitet und werden im Hinblick auf ihre Eignung für den hier vorliegenden Kontext untersucht.

=== GitHub-Flow

#figure(image("assets/GitHub-Flow.png", width: 80%), caption: "GitHub Flow" )<GitHub-Flow>

GitHub-Flow ist ein schlankes, auf kontinuierliche Auslieferung ausgerichtetes Branching-Modell. Es eignet sich besonders für Teams, die schnell auf neue Anforderungen reagieren und Änderungen zeitnah bereitstellen müssen. Charakteristisch sind kurze Feature-Branches, häufige Pull Requests und automatisierte Tests, sodass neue Anpassungen zügig in den Main-Branch integriert werden können. Entsprechend wird GitHub-Flow vor allem in DevOps-nahen Umgebungen und Projekten mit hoher Release-Frequenz, etwa bei Web-Anwendungen, häufig eingesetzt.

Die Ausgestaltung Pull-Request-basierter Zusammenarbeit und ihre Auswirkungen auf den Entwicklungsprozess sind in der Literatur ausführlich untersucht worden @gousios2014pullbased.

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
), caption: "GitHub-Flow Branches")<Tabelle-GitHub-Flow>

@Tabelle-GitHub-Flow zeigt die Branch-Typen und ihre Aufgaben; @GitHub-Flow visualisiert den Ablauf. Beide verdeutlichen: GitHub-Flow ist optimiert für schnelle, häufige Feature-Releases. Ob dieses Modell geeignet ist, hängt von organisatorischen und technischen Rahmenbedingungen ab.
==== Vorteile
- Schnelle Iteration
- Geringe Komplexität
- Ideal für kontinuierliche Integration
==== Nachteile
- Wenig Struktur für große Releases
- Risiko eines instabilen Main-Branches bei häufigem Mergen
==== Bewertung für den O-SW Kontext

*Erkenntnis:* GitHub-Flow bietet Einfachheit und Agilität für kontinuierliche Integration und kurze Release-Zyklen.

*Limitation:* Im Kontext der #gls("O-SW") mit meilensteinhaften Releases wird ein Schwachpunkt offenbar: Die Abwesenheit separater Release-Vorbereitung erhöht das Risiko von Instabilitäten beim Freigabeprozess.

*Konsequenz:* Strukturiertere Modelle wie Git-Flow sind daher für diesen Einsatzbereich zu prüfen.

=== Git-Flow: Strukturiertes Branching für komplexe Releases <Git-Flow>

Git-Flow ist ein strukturiertes Branching-Modell, das Entwicklungsabfläufe klar trennt und stabile Releases absichert. Vorgestellt 2010 von Vincent Driessen (@driessen2010gitflow), wird es in Projekten mit parallelen Features, Hotfixes und Versionen am häufigsten angewendet.

#figure(image("assets/Gitflow-Workflow-4.png", width: 80%), caption: "Git Flow" )<Git-Flow-Grafik>

Das Modell basiert auf mehreren langlebigen Branches mit definierten Rollen. @Git-Flow-Grafik zeigt deren Zusammenspiel, @tabelle-Git-Flow beschreibt die einzelnen Branches und ihr Verhalten.

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
), caption: "Git-Flow Branches")<tabelle-Git-Flow>

Dieses Modell unterstützt strukturierte Abfälle mit klar umrissenen, großen und aufbauend verknüpften Releases. Für Rolling-Release-Ansätze ist es weniger geeignet, da die Verweildauer bis Verhältnisfreigabe tendenziell länger ist. Da die #gls("O-SW") Releases primär an Projektmeilensteinen anknüpft, ist Git-Flow für diesen Fall gut erreichbar.
 
== Richtlinien E-SW<E-SW-Richtlinien>


#figure(image("assets/Git-Flow-E-SW.png", width: 90%), caption: "Git Flow E-SW" )<Git-Flow-E-SW>

Zu Beginn wurde der aktuelle Stand der Richtlinien bei Ralf Scheyerle abgefragt, der in der #gls("E-SW") für dieses Thema verantwortlich ist. Da das Team nur aus fünf Personen besteht, waren die Vorgaben bislang überwiegend mündlich überliefert und lediglich in einem einfachen Word-Dokument festgehalten.

Die in @Git-Flow-E-SW dargestellte Vorgehensweise zeigt, dass die aktuelle Strategie der #gls("E-SW") den Git-Flow-Prinzipien aus @Git-Flow weitgehend folgt. Ein wesentlicher Unterschied, der in @tabelle-E-SW genauer erläutert wird, liegt in der Release-Logik: Releases werden nicht in separaten release/\*-Branches vorbereitet, sondern in main durchgeführt und anschließend über einen release/\*-Branch veröffentlicht. Dadurch ist der Zugriff auf frühere Release-Stände sehr schnell möglich, ohne über Tags oder Pull Requests nach Versionsnummern suchen zu müssen. Nachteilig ist jedoch, dass sich über die Zeit viele inaktive Branches ansammeln und die Übersichtlichkeit sinkt.

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
), caption: "E-SW Branches")<tabelle-E-SW>

Das Word-Dokument enthält in @Git-Flow-E-SW und @tabelle-E-SW die Kernelemente einer angepassten Git-Flow-Variante. Der zentrale Unterschied besteht darin, dass Releases nicht in separaten release/\*-Branches vorbereitet, sondern in main erstellt und anschließend über einen release/\*-Branch veröffentlicht werden.
Abgesehen davon entsprechen die grundsätzlichen Vor- und Nachteile weitgehend dem klassischen Git-Flow-Modell.

== Zwischenfazit zur Branching-Wahl

Auf Grundlage der Gespräche mit Robin Hettel wurde festgehalten, dass die Einführung von Git-Flow sowohl fachlich sinnvoll als auch organisatorisch gewünscht ist. Der Hauptgrund liegt darin, dass Git-Flow für wenige, größere Releases besser geeignet ist als GitHub-Flow. Zudem ist der in @E-SW-Richtlinien genannte Vorteil für den vorliegenden Kontext weniger entscheidend, da Releases ausschließlich an Projektmeilensteinen stattfinden und der aktuelle, stabile Code-Stand im Vordergrund steht.


= Evaluation des Code-Review-Ansatzes


GitHub Copilot kann mehr leisten als reine Codevervollständigung. Das System kann Entwickler auch dabei unterstützen, bestehende Coding-Conventions im Alltag konsequenter einzuhalten. Während der Arbeit analysiert Copilot den jeweiligen Kontext, erkennt wiederkehrende Muster und orientiert sich an projektinternen Standards. Dadurch entstehen Vorschläge, die nicht nur funktional sind, sondern auch besser zum Stil des Projekts passen. Teams profitieren dadurch von konsistenterer Codequalität, weniger manuellen Nacharbeiten und einem effizienteren Review-Prozess.

Die Bedeutung strukturierter Code-Reviews für Qualitätssicherung und Teamzusammenarbeit ist in der Forschung breit belegt @bacchelli2013moderncodereview @mcintosh2016codereview.

== Rahmenbedingungen und Testumgebung

=== Testinfrastruktur

Copilot-Reviews sind bei fpt in Erprobung. Infrastruktur:
- Separates Test-Repository (isoliert von Produktion)
- Copilot nutzt nur lokale Repository-Inhalte
- Coding-Conventions als `.md`-Dateien im `docs`-Ordner
- Copilot Anweisungen als `.md`-Dateien im `.github`-Ordner

*Datenverteilung:* Zentrale GitHub Action verteilt aktualisierte Conventions und Copilot Anweisungen zu Bibliotheken und Template-Projekten. Neue Projekte erben Actions automatisch (vgl. @CodingConventionDiagramm). Technische Details @githubdocs_prreviews @githubdocs_protectedbranches.


#figure(image("assets/CodingConventionFlow.png", width: 90%), caption: "Coding-Convention Verteilung" )<CodingConventionDiagramm>

*Status:* Actions in allen O-SW-Repositories außer Projekt-Repositories vorhanden; intensive Tests bestätigen automatische Übernahme.

=== Testmethodologie

Im Test-Repository prüft Copilot automatisch jeden PR auf main gegen Conventions. Vorgehen:
- Absichtlich typische Fehler eingebaut
- Checkliste erst NACH Review hinzugefügt (Nachvollziehbarkeit, methodische Konsistenz)
- Bei Änderungen an Conventions: vorherigen PR schließen, neuen erstellen (vergleichbare Bedingungen)
== Evaluationsergebnisse und Verbesserungszyklen

=== Iteration 1: Präzision der Conventions

*Befund:* Gründlichkeit der Copilot-Reviews unzureichend.

*Ursache:* Coding-Conventions nicht präzise genug formuliert.

*Gegenmaßnahmen:*
- Kapitel "TwinCat" und "Allgemein" vollständig überarbeitet
- Microsoft-Copilot-Agent "Prompt Coach" für KI-kompatible Formulierung eingesetzt
- Sprachliche Präzisierung + erweiterte Copilot-Anweisungen
- Jede Regel erhielt eindeutige ID (Format: Kapitelnummer-Fehlernummer, z. B. "3.2.7-2")
- KI-generierte Vorschläge durch mehrere Personen validiert

*Validierungsprocess:* Nur nach sorgfältiger inhaltlicher Prüfung übernommen. keine automatische Übernahme.

*Effekt:* Qualität deutlich gestiegen. Kapitel- und Regelreferenzen konsistent. erkannte Probleme sichtbar.

=== Iteration 2: Kommentarunterdrückung bei Umbenennungen

*Befund:* Copilot erkannte Struct-Variablen-Benennungsverstöße (z. B. fehlendes `stc_`-Präfix), GitHub unterdrückte Kommentare.

*Ursachenanalyse:* GitHub unterdrückt Meldungen bei:
- Dateien, die als "neu hinzugefügt" erscheinen (nach Umbenennung)
- Fehlender stabiler Diff-Verknüpfung für umbenannte Dateien
- Umbenennung als intentionale Änderung (Copilot "widerspricht" PR-Intent)

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

Nach dieser Änderung erkannte GitHub Copilot die Regelverstöße zuverlässig. Die Hinweise wurden jedoch weiterhin teilweise als "suppressed due to uncertainty" markiert. Zur Analyse wurde die GitHub-Copilot-Funktion "Agents" genutzt. Diese kann das gesamte Repository inklusive früherer Pull Requests als Kontext einbeziehen und ermöglicht dadurch fundiertere Auswertungen.
Die Analyse zeigte, dass GitHub die Kommentare selbst unterdrückte, sobald sie auf umbenannte Dateien verwiesen. Da Git-Umbenennungen im Diff häufig als Löschen und Neu-Anlegen dargestellt werden, werden solche Befunde schneller als unsicher eingestuft, weil:
- Die gesamte Datei als „neu hinzugefügt" erscheint
- GitHub keine stabile Diff-Kontext-Verknüpfung für umbenannte Dateien aufbauen kann
- Das Umbenennen an sich als intentionale Änderung gilt. Copilot widerspricht dem PR-Intent
Daraus ergibt sich: Copilot erkennt den Verstoß korrekt, GitHub unterdrückt den Kommentar jedoch im Anschluss.

Die durch den Agent gelieferten Analysen wurden manuell geprüft und mit den tatsächlichen Repository-Änderungen abgeglichen, um Fehlinterpretationen auszuschließen.

Als Gegenmaßnahme wurde vorgeschlagen, die in @Klausel gezeigte Anweisung in die GitHub-Copilot-Instruktionen aufzunehmen.

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

Damit werden Verstöße nicht nur an der Deklaration, sondern zusätzlich an der ersten Verwendung in einer nicht umbenannten Datei gemeldet. Die Wahrscheinlichkeit einer Unterdrückung durch GitHub sinkt dadurch deutlich.
Nach dem Test zeigte sich, dass die ursprünglichen Kommentare weiterhin teilweise unterdrückt wurden, Verstöße jedoch zusätzlich an der ersten Verwendung der betroffenen Variablen als Fehler erschienen. Da diese Fundstellen nicht in umbenannten Dateien lagen, blieben die entsprechenden Meldungen sichtbar.


=== Iteration 3: Balance zwischen Präzision und Agilität

*Feedback von Ralf Scheyerle:* Instructions zu eng gefasst → Copilot zuverlässig als Reviewer, aber später als Code-Agent eingeengt.

*Anpassung:* Instructions bewusst geöffnet, ohne Review-Qualität zu verlieren. Restriktive Reviewing-Klausel entfernt.

*Konsequenz:* Überarbeitete TwinCat-Instructions ins Übersichts-Repository übernommen → einheitlicher Verteilungsprozess für Conventions UND Instructions (vgl. @CodingConventionDiagramm).

=== Iteration 4: Bestandscode-Analyse

*Erkannt:* Copilot prüft in PR-Reviews nur veränderte Zeilen → Bestandscode (z. B. in Template-Projekten) bleibt unkontrolliert.

*Lösung:* Spezialisierter Agent zur Bestandscode-Analyse entwickelt (Zusammenarbeit mit Ralf Scheyerle). Dieser Agent wurde sofort eingesetzt, um Template-Projekte und Standard-Libraries zu bereinigen.



== SPS-Programmierung

Da Beckhoff-SPS-Sourcecode, also TwinCat-Programme, nicht als Klartext vorliegt, sondern XML-basiert gespeichert wird, kann er nicht in beliebigen Texteditoren bearbeitet werden. Zudem sind Kompilierung, Upload auf die Steuerung und Debugging keine offenen Standardprozesse. Daher ist hierfür eine Beckhoff-spezifische Entwicklungsumgebung erforderlich. Die SPS-Programmierung wird deshalb nicht mehr in Visual Studio, sondern in der TwinCat XAE Shell umgesetzt. Diese basiert zwar auf Visual Studio, ist jedoch kostenfrei und in der Regel performanter. Außerdem werden neue TwinCat-Versionen typischerweise zuerst für die XAE Shell bereitgestellt, da diese direkt von Beckhoff veröffentlicht wird.

Für den Entwicklungsprozess in diesem Umfeld ergibt sich damit eine klare Trennung der Verantwortlichkeiten der Werkzeuge:
- VS Code für Projektorganisation, Versionsverwaltung, Reviews und begleitende Textartefakte.
- TwinCat XAE Shell für die eigentliche SPS-Programmierung und Bearbeitung der projektspezifischen XML-basierten Inhalte.

Diese Aufteilung reduziert Tool-Konflikte und unterstützt einen stabilen Ablauf: Fachliche Änderungen werden in der XAE Shell umgesetzt, organisatorische und kollaborative Schritte erfolgen in VS Code und GitHub.

// TODO: Ablaufgrafik ergänzen (von Codeänderung bis Pull Request).
// Beispiel:
// #figure(image("assets/SPS-Workflow.png", width: 90%), caption: "Ablauf SPS-Änderung bis Review")<SPS-Workflow>

== GitHub Verwaltung

Bisher wurde die GitHub-Verwaltung überwiegend über Sourcetree oder GitHub Desktop durchgeführt. In VS Code ist jedoch bereits eine GitHub-Integration vorhanden, die unter anderem folgende Prozesse abdeckt:
- pull
- push 
- commit
- checkout
- Branch-Auswahl
- Arbeitsbaum
- Verwaltung von Änderungen

Das zugehörige Interface ist, wie in @VS-Code-SourceControl dargestellt, intuitiv aufgebaut und kann jederzeit über die Seitenleiste aufgerufen werden.
Um zusätzlich Funktionen wie Issues, Actions und Pull Requests abzubilden, wurden die Extensions "GitHub Pull Requests" und "GitHub Actions" als empfohlene Erweiterungen ergänzt.

Für die tägliche Arbeit lässt sich daraus ein durchgängiger Ablauf ableiten:
- Synchronisation des lokalen Stands (pull/fetch) und Wechsel auf den vorgesehenen Arbeitsbranch.
- Umsetzung der Änderung mit laufender Sichtprüfung im Arbeitsbaum.
- Commit und Push aus VS Code, anschließend Erstellung oder Aktualisierung der Pull Request.
- Review und Freigabe über die GitHub-Integration, danach Merge in den Zielbranch.

Die Einführung dieser integrierten Vorgehensweise reduziert Medienbrüche und unterstützt die in dieser Arbeit definierten Qualitätsmechanismen, insbesondere Pull-Request-basierte Freigaben und nachvollziehbare Änderungsverläufe.

#figure(image("assets\VS-Code-SourceControl.png", width: 50%), caption: "VS-Code Source Verwaltung" )<VS-Code-SourceControl>

= Pilotierung im Projekt

Um die praxisnahe Integration der eingeführten Qualitätssicherungsprotokolle zu bewerten, wurden diese in ein Projekt eingebracht, das sich noch in der Vorinbetriebnahme befand. Dazu wurde mit den Projektprogrammierern David Kromer und Alexandru Trusi ein Termin angesetzt, in dem die geplanten Methoden gemeinsam besprochen wurden. Insbesondere die Branching-Strategien wurden positiv bewertet, da beide Programmierer die in @Problematik beschriebenen Herausforderungen bereits aus ihrem Arbeitsalltag kannten.

Alexandru brachte zusätzlich den Vorschlag ein, neben Feature-Branches pro Entwickler jeweils einen eigenen Develop-Branch zu nutzen. Dadurch kann zunächst unabhängig gearbeitet werden, bevor stabile Zwischenstände per Pull Request in develop überführt werden.
Ergänzend können nutzerspezifische Feature-Branches für die Umsetzung konkreter Funktionen angelegt werden.
Die Benennung könnte beispielsweise wie folgt aussehen:
- user/develop
- user/feature/NeuesFeature

Beide Programmierer signalisierten außerdem Offenheit gegenüber Copilot, sofern die Review-Ergebnisse konsistent und verlässlich bleiben.


In einer anschließenden Abstimmung zu den Meeting-Ergebnissen merkte Robin Hettel an, dass statt nutzerbezogener Branches eher anlagenbereichsbezogene Branches sinnvoll seien. Dadurch könnten Programmierer einzelne Bereiche zeitweise "reservieren" und dort konzentriert arbeiten. Gleichzeitig würde dieser Ansatz helfen, keine gesonderten Richtlinien nur für die Anlagenprogrammierung einzuführen, sondern einen unternehmensweit einheitlichen Standard beizubehalten.

Nach der Formulierung dieser Richtlinien startete das Projekt in seine erste Phase, die virtuelle Inbetriebnahme. In dieser Phase werden die Roboter in einer Simulation angelegt und bereits grundlegend programmiert.


== Umsetzung im Pilotprojekt
=== Branching Strategien

Die Branching-Strategie wurde auf Basis des angepassten Git-Flow-Modells umgesetzt. Dabei wurden die Aufgaben der einzelnen Branches klar abgegrenzt und der Merge-Prozess über Pull Requests verbindlich standardisiert. Ergänzend wurden Benennungsregeln für Feature-, Bugfix- und Release-Branches festgelegt, um eine hohe Nachvollziehbarkeit und einheitliche Abläufe sicherzustellen.

==== Erfahrungen und Probleme

//TODO  dokumentieren in meeting nach pr in main
*Branching-Strategie funktioniert:*
- Mergekonflikte entstehen selten und lassen sich leicht lösen
- Sicheres paralleles Arbeiten ohne Datenverlust
- PR-basierte Reviews strukturieren den Freigabeprozess
Negatives:
- 
#lorem(20)

=== Copilot Code-Review

Das Copilot-gestützte Code-Review läuft analog zum Test-Repository. Jeder PR zu main wird automatisch gegen die Coding-Conventions geprüft; Befunde integrieren sich direkt in den Freigabeprozess.

==== Erfahrungen und Probleme

Das Projekt lief regulär mit einem Unterschied: Jeder PR zu main löste automatisch einen Copilot-Review aus.

Nach dem ersten Meilenstein (Virtuelle Inbetriebnahme) zog Alexandru folgende Bilanz:
- Rechtschreibfehler: Zuverlässig erkannt, automatischer Resolve funktioniert
- Falsch-Positive: Manchmal Meldungen für Variablen, die in FUP tatsächlich verwendet werden
- Schweregrad-Einstufung: Copilot überschätzt manchmal die Kritikalität von Fehlern
- Syntaxfehler in Vorschlägen: Strukturelle Verbesserungen erfordern teils manuelle Nachprüfung
//TODO  dokumentieren in meeting nach pr in main
#lorem(20)


= Projektmanagement mit ZenHub

ZenHub ist ein webbasiertes Projektmanagement-Tool für Softwareentwicklung, direkt in GitHub integriert. Vorteil: Aufgabenplanung und Quellcodeverwaltung in einer Umgebung - Medienbrüche zwischen Ticket-System, E-Mail, Repository entfallen (vgl. @zenhub_docs).

*Nutzen für die O-SW:*
Branching-Strategien und Code-Reviews sichern technische Qualität; ZenHub stärkt Prozessqualität durch Priorisierung, klare Verantwortlichkeiten, Terminbezug und Fortschritttransparenz.

*Funktionale Bausteine:*
- Boards: Operative Tagesgeschäft-Steuerung
- Epics: Bündelung verwandter Features/Arbeitspakete
- Roadmaps: Zeitplanung über Iterationen/Meilensteine
- Automatisierungen: Regelmäßige Statuswechsel & Workflows

Resultat: Zentrale, nachvollziehbare Planungs- und Kommunikationsstruktur für Teams jeder Größe.

== E-SW Prozess als Referenz
s
In der E-SW steuert ZenHub primär FlexOp-Releases. Etablierter Ablauf:
- Issues erfassen & vorqualifizieren
- Teamleiter Simon Würzer priorisiert (Dringlichkeit/Fachlichkeit)
- Priorisierte Tickets zuordnen, Entwickler einweisen
- Größere Vorhaben als Epics, zerlegbar in Einzel-Issues
- Release-Zeitpunkte in Roadmap hinterlegen, Issues zuordnen

*Effekt:* Hohe Transparenz über Zuständigkeiten & Fortschritt; operative Tasks jederzeit im Kontext von Release-Zielen.

== Übertragung auf die O-SW

Ziel: Ersetze mündliche/E-Mail-Abstimmung durch standardisierten, nachvollziehbaren Prozess. Dies ist vor allem bei kurzfristigen #gls("FlexOp")-Versionsänderungen erforderlich - Abhängigkeiten früh sichtbar, Abstimmungsaufwand reduziert.

*Vorgehen:*
- Issues erfassen, priorisieren, Verantwortliche zuordnen
- Größere Vorhaben in Epics bündeln → umsetzbare Einheiten
- Zeitkritische Pakete zu Meilensteinen zuordnen
- Board-Spalten klären (z. B. Backlog → Planned → In Progress → Review → Done)
- Rollen definieren: Wer priorisiert? Wer genehmigt Releases?

Resultat: ZenHub fungiert als Verbindungselement zwischen technischer Umsetzung, Branching-Prozess und Release-Kommunikation - nicht nur als Ticket-Tool.


= Schulung und Wissenssicherung

Damit die Methoden wirksam und konsistent greifen, entstehen strukturierte Schulungsunterlagen. Sie unterstützen das Onboarding neuer Mitarbeitender und etablieren abteilungsweit einheitliche Standards.

== Bedarfsermittlung

Ein Austausch mit Mitarbeiter Matthias Scheuring zur Bedarfsermittlung: geringe Git/GitHub-Vorerfahrung, aber Projektberührung. Identifizierte Einstiegshürden:

*Grundverständnis Git/GitHub:* Nicht ausreichend bekannt → Werkzeug nicht konsequent eingesetzt → wiederholt Anfragen um Commits.

*Branch-Mechanik:* Anfangs unklar → Commits nur in main → Konflikte im Code und Team (@ProblematikBranching).

*Unternehmenskontext:* Prozessverständnis fehlte.

Aus dieser Analyse entstanden die nachfolgenden Schulungsbausteine.

== Schulungsumgebung: Evaluierte Optionen

*Microsoft Learn:* Etablierte GitHub-Kurse, nicht an fpt-Prozesse anpassbar; teilweise nicht-fpt-Standard-Workflows.

*GitHub Skills:* Hochwertige Inhalte, aber zu workspace-fokussiert; begrenzte Übertragbarkeit auf TwinCat/WorkVisual-Kontext.

*YouTube:* Umfassende didaktische Inhalte, ohne O-SW-spezifische Prozesse; nur ergänzendes Medium geeignet.

*Eigene Dokumentation:* ✓ Ideal - fpt-Wiki für beliebig gestaltbare Unterlagen, multimedial erweiterbar, an Unternehmensstandards anpassbar.

→ *Gewählte Strategie:* Interne Wiki-Dokumentation mit ergänzenden Präsentationen und YouTube-Videos.


== Umsetzung der Dokumentation

=== Git und GitHub Grundlagen


Die Dokumentation der Git- und GitHub-Grundlagen bildet den Einstieg für neue Mitarbeitende und Auszubildende. Behandelt werden Versionsverwaltung, Branches und Pull Requests im Unternehmenskontext. Sie dient sowohl zum Onboarding als auch als Nachschlagewerk.

*Inhalte:* Git-Grundkonzepte (Working Directory, Staging Area, Repositories); Team-Workflow (klonen → ändern → committen → pushen → PR); Branches, Merges, Konfliktlösung, typische Fehler.

*Format:* Schriftliche Referenz + Präsentations-Link + Video-Tutorial → mehrstufiges Lernangebot.

*Rollout:* Wiki-Publikation → Einweisungsgespräche → Feedback → fpt-spezifische Vorgaben (Branching, Reviews) integrieren.

*Lernziele:*
- Git/GitHub-Grundkonzepte verstehen und unterscheiden
- Standard-Workflow sicher durchführen
- Branches und Merges korrekt handhaben
- Typische Probleme erkennen und lösen


=== Branching Strategien


Im Schulungsbaustein zu Branching-Strategien wird das in dieser Arbeit eingeführte Vorgehen praxisnah vermittelt. Der Schwerpunkt liegt auf der eindeutigen Zuordnung von Branch-Typen, der strukturierten Nutzung von Pull Requests sowie der nachvollziehbaren Integration in develop und main. Ziel ist eine konsistente Anwendung der festgelegten Regeln im Tagesgeschäft.

Die Unterlage baut inhaltlich auf den Git- und GitHub-Grundlagen auf und überführt diese in den konkreten Teamprozess der #gls("O-SW"). Zunächst werden Zweck und Verantwortlichkeiten der verwendeten Branch-Typen systematisch erläutert (main, develop, feature\/\*, bugfix\/\*, release\/\*, hotfix\/\*). Darauf aufbauend wird der verbindliche Ablauf vom Anlegen eines Arbeitsbranches bis zum Merge über Pull Requests dargestellt. Ein besonderes Gewicht liegt auf den in der Abteilung eingeführten Regeln "keine direkte Arbeit auf main" und "nach Möglichkeit keine direkte Arbeit auf develop", um ungeprüfte Integrationen zu vermeiden.

Ergänzend werden Benennungsstandards und typische Fehlermuster behandelt. Dazu zählen unter anderem uneinheitliche Branch-Namen, fehlende Rückführung von Hotfixes in develop sowie zu große oder fachlich gemischte Pull Requests. Die Teilnehmenden erhalten hierfür klare Leitlinien zur Benennung, zur inhaltlichen Abgrenzung von Commits und zur Vorbereitung reviewfähiger Pull Requests.

Zur didaktischen Strukturierung umfasst der Baustein drei Ebenen: erstens eine kompakte Prozessdarstellung als Referenz, zweitens angeleitete Schritt-für-Schritt-Abläufe für wiederkehrende Standardsituationen (Feature, Bugfix, Release, Hotfix) und drittens kurze Übungsaufgaben mit typischen Teamkonstellationen. Damit wird sichergestellt, dass nicht nur Begriffe bekannt sind, sondern der Ablauf im Projektalltag sicher angewendet werden kann.

*Lernziele des Bausteins:*
- Die Teilnehmenden können die Funktion der Branch-Typen im angepassten Git-Flow-Modell fachlich korrekt erklären und voneinander abgrenzen.
- Die Teilnehmenden können für eine gegebene Aufgabe den passenden Branch-Typ auswählen und regelkonform benennen.
- Die Teilnehmenden können einen vollständigen Standardablauf von der Änderung bis zum Merge über Pull Request durchführen und begründen.
- Die Teilnehmenden können typische Prozessfehler erkennen (z. B. falscher Zielbranch, fehlende Rückführung von Hotfixes) und geeignete Korrekturen ableiten.


=== Entwicklungsumgebung


*Basis:* PowerPoint (VS Code Bedienung Grundverständnis) → Schulungsunterlage (Referenz).

*Inhalte:* Installation + Workspace-Setup; täglicher Workflow (fetch/pull → Branch-Wechsel → Bearbeitung → Commit → Push → PR); TwinCat XAE Shell Integration ("Open with default application"); KI-Einsatz (Copilot-Workflow, kritische Bewertung).

*Lernziele:*
- VS Code Setup durchführen und Workspace-Konfigurationen anwenden
- Täglichen GitHub-Workflow sicher anwenden
- XAE Shell korrekt als Komplement nutzen
- KI-Hinweise kritisch als Entscheidungshilfe bewerten

Didaktisch folgt der Baustein demselben Muster wie die übrigen Schulungskapitel: kompakte Einführung, standardisierte Schrittfolgen, Best Practices und typische Fehler. Damit werden nicht nur Bedienkenntnisse vermittelt, sondern ein verbindliches Verhaltensmodell für den Teamalltag etabliert.


= Einführung im Team



= Fazit

*Erkenntnis:* Im Rahmen dieser Arbeit wurden für die identifizierten Problemfelder Branching, Management und Code-Review konkrete Maßnahmen konzipiert und in den Projektkontext überführt. Die Einführung eines angepassten Git-Flow-Modells, der Einsatz von Copilot-gestützten Reviews sowie die Einbindung von ZenHub adressieren sowohl technische als auch organisatorische Schwachstellen der bisherigen Arbeitsweise.

Die Einordnung der erwarteten Prozesswirkung kann ergänzend auf etablierten Befunden zu Delivery- und Team-Performance gestützt werden @forsgren2018accelerate.

*Implikation:* Die durchgeführten Tests und Abstimmungen zeigen, dass die gewählten Ansätze grundsätzlich geeignet sind, Transparenz, Nachvollziehbarkeit und Qualität in der Zusammenarbeit zu erhöhen. Gleichzeitig wurde deutlich, dass die Wirksamkeit der Maßnahmen von klar formulierten Richtlinien, konsistenter Anwendung im Team und einer belastbaren Schulungs- und Dokumentationsbasis abhängt.

// TODO: Hier belastbare Abschlussbefunde (z. B. Beobachtungen, Kennzahlen, Grenzen und Ausblick) eintragen.
#lorem(80)

*Ausblick/Übergang:* Insgesamt legt die Arbeit damit eine praktikable Grundlage für einen einheitlichen, GitHub-basierten Entwicklungs- und Steuerungsprozess in der #gls("fpt Systems GmbH").
