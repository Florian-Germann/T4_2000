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

Eine strukturierte Quellcodeverwaltung ist eine zentrale Voraussetzung für moderne Softwareentwicklung. Gerade in verteilten Teams, die gleichzeitig an mehreren Komponenten arbeiten, muss jederzeit nachvollziehbar sein, welche Änderungen wann und warum erfolgt sind. Git-basierte Plattformen wie GitHub bieten dafür die technische Grundlage.

GitHub ermöglicht die zentrale Ablage, Verwaltung und gemeinsame Weiterentwicklung von Softwareprojekten. Durch die zugrunde liegende Git-Versionskontrolle lassen sich Änderungen transparent dokumentieren und frühere Zustände bei Bedarf wiederherstellen. Besonders in komplexen Projekten erhöht das die Nachvollziehbarkeit und reduziert Abstimmungsaufwand.

Ein wesentliches Konzept in diesem Zusammenhang sind Branches. Sie erlauben es, neue Funktionen, Fehlerbehebungen oder Experimente getrennt von der Hauptlinie umzusetzen. Erst nach einer Prüfung werden Änderungen zurückgeführt. Dadurch können mehrere Personen parallel arbeiten, ohne sich gegenseitig zu blockieren.

Die Kombination aus Versionskontrolle, klarer Historie und parallelen Entwicklungszweigen schafft damit eine belastbare Grundlage für Teamarbeit in der Softwareentwicklung.

Wie gut GitHub in der Praxis funktioniert, hängt jedoch stark von den gewählten Prozessen ab. Insbesondere eine passende Branching-Strategie und ein funktionierendes Team-Management sind entscheidend. Branching-Regeln legen fest, wie Features, Bugfixes und Releases vorbereitet und integriert werden. Sie beeinflussen damit nicht nur den technischen Ablauf, sondern auch Koordination, Planbarkeit und Qualitätssicherung.

Gleichzeitig reicht eine gute Branching-Strategie allein nicht aus. Ebenso wichtig ist eine strukturierte Aufgabenplanung im Team. Projektmanagement-Werkzeuge helfen dabei, Arbeitspakete transparent zu priorisieren, Verantwortlichkeiten eindeutig zuzuordnen und Fortschritte laufend sichtbar zu machen. Durch die enge Verzahnung mit Entwicklungsprozessen, automatisierten Workflows und übersichtlichen Boards entsteht ein gemeinsames Verständnis darüber, welche Aufgaben als Nächstes anstehen und wo Engpässe drohen. Das stärkt Zusammenarbeit und erhöht zugleich Qualität und Umsetzungsgeschwindigkeit.


Zur didaktisch klaren Einordnung folgt die Arbeit der Abfolge Ausgangslage, konzeptioneller Lösungsansatz, fachliche Grundlagen, Evaluation im Testkontext, Pilotierung im Projekt, organisatorische Implementierung und Schulung sowie abschließendes Fazit.


= Ausgangslage und Zielbild

== Problematik<Problematik>

=== Branching<ProblematikBranching>

In der Abteilung #gls("O-SW") gibt es bislang keine einheitliche und verbindliche Vorgehensweise für den Umgang mit GitHub-Branches. Zwar wurden Richtlinien aus der #gls("E-SW") bereits für interne Bibliotheken und Template-Projekte übernommen, in der praktischen Arbeit an Anlagen zeigt sich jedoch, dass diese Vorgaben nicht in allen Fällen direkt passen. Die Entwicklungsabläufe unterscheiden sich in Struktur und Inhalt, wodurch im Alltag Unklarheiten entstehen.

Fehlt diese Passgenauigkeit, werden Branching-Entscheidungen häufig individuell getroffen. Das führt zu uneinheitlichen Abläufen, erschwert die Nachvollziehbarkeit von Änderungen und erhöht das Konfliktpotenzial beim Zusammenführen von Code. Gleichzeitig sinkt die Effizienz in der Zusammenarbeit, weil gemeinsame Regeln nicht konsequent angewendet werden können.

=== Management

Im Bereich Management besteht in der #gls("O-SW") derzeit das Problem, dass keine dedizierte Team-Management-Software genutzt wird. Die Release-Planung erfolgt überwiegend über mündliche Absprachen und E-Mail-Verläufe. Das ist in der täglichen Praxis fehleranfällig und nur eingeschränkt transparent. Zusätzlich entstehen regelmäßig Engpässe, wenn neue Versionen von #gls("FlexOp") kurzfristig bereitgestellt werden und notwendige Vorbereitungen nicht rechtzeitig angestoßen wurden.

=== Code-Review

Trotz klar formulierter Coding-Conventions gelangen weiterhin falsch benannte Variablen oder unzureichend dokumentierte Codeanteile in Projekte. Ursache ist vor allem, dass die Einhaltung der Regeln bisher nur eingeschränkt und überwiegend manuell geprüft wird. Für #gls("TwinCat") stehen keine klassischen Linter#footnote("Ein Linter prüft Code automatisch auf Fehler und Stilabweichungen.") oder vergleichbare Standardwerkzeuge zur Verfügung, wodurch die automatisierte Qualitätskontrolle deutlich erschwert wird.

=== Entwicklungsumgebung

Im Moment existiert in der #gls("O-SW") das Problem, dass keine einheitliche Entwicklungsumgebung vorhanden ist. Das kommt daher, da die Lizenzen für die alte Lösung ausgelaufen sind und zum einen wegen Kosten und zum anderen wegen langen Update Zeiten nun eine neue Lösung gefunden werden soll. Allerdings steht zum aktuellen Zeitpunkt noch kein neues Programm bereit um das alte zu ersetzen. 

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

Dass die Entwickler in der #gls("O-SW") wieder nahtlos Programmieren können soll nun eine neuen Lösung gefunden werden. Bisher wurde hier Visual Studio 2017 in Kombination mit dem Explorer, Github Desktop oder Sourcetree und ein in Visual Studio integriertes Programm für KUKA Steuerungen verwendet. Das integrierte, Firmeneigene Programm namens FlexManager ist allerdings schon sehr alt und kann nicht auf die neuen Visual Studio Version geupdatet werden. Da aus diesem Grund ohnehin eine neuentwicklung nötig wäre und die Lizenzen für Visual Studio auslaufen, wurde beschlossen eine Entwicklungsumgebung zu erarbeiten. Hierzu wurde sich für VSCode in Kombination mit der TwinCat XAE Shell entschieden, da VSCode sich durch Extensions hervorragend erweitern lässt und sich so ideal auf die Anforderungen anpassen lässt. 

=== Fazit

Damit die eingeführten Verbesserungen im Alltag zuverlässig funktionieren, müssen alle Mitarbeitenden nach der Implementierung informiert und entsprechend geschult werden. Zusätzlich ist eine zentrale, leicht zugängliche Dokumentation der neuen Abläufe notwendig, damit die Anwendung langfristig konsistent bleibt.

Insgesamt dienen die Maßnahmen dazu, sowohl die Arbeitsqualität als auch die Code-Qualität in der fpt Systems GmbH nachhaltig zu erhöhen.


= Grundlagen und Ausgangslage

== Industriestandards
In der Softwareentwicklung haben sich über viele Jahre hinweg unterschiedliche Branching-Standards etabliert.
Im Folgenden werden die zwei bekanntesten Modelle vorgestellt und im Hinblick auf ihre Eignung für den vorliegenden Anwendungsfall eingeordnet.

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
))<Tabelle-GitHub-Flow>

@Tabelle-GitHub-Flow beschreibt die einzelnen Branches und ihre Aufgaben, während @GitHub-Flow den Ablauf grafisch ergänzt. Daraus wird ersichtlich, dass diese Strategie vor allem für schnelle, häufige Feature-Releases geeignet ist. Ob sie im konkreten Fall sinnvoll ist, hängt jedoch immer von den organisatorischen und technischen Rahmenbedingungen ab.
==== Vorteile
- Schnelle Iteration
- Geringe Komplexität
- Ideal für kontinuierliche Integration
==== Nachteile
- Wenig Struktur für große Releases
- Risiko eines instabilen Main-Branches bei häufigem Mergen
==== Fazit

Zusammenfassend ist GitHub-Flow eine einfache und agile Strategie, die besonders gut zu Teams passt, die auf kontinuierliche Integration und kurze Release-Zyklen setzen. Die kurzen Feature-Branches und direkten Merges in main sorgen für Flexibilität und wenig Prozess-Overhead. Im Kontext der #gls("O-SW") mit stärker meilensteinorientierten Releases zeigt sich allerdings ein Nachteil: Da eine separate Release-Vorbereitung fehlt, steigt das Risiko von Instabilitäten im Freigabeprozess. Für diesen Kontext sind daher strukturiertere Modelle wie Git-Flow meist besser geeignet.

Damit stößt GitHub-Flow in der #gls("O-SW") an klare Grenzen. Im nächsten Schritt wird daher Git-Flow betrachtet, um die Eignung für den vorliegenden Kontext zu bewerten.

=== Git-Flow <Git-Flow>


#figure(image("assets/Gitflow-Workflow-4.png", width: 80%), caption: "Git Flow" )<Git-Flow-Grafik>

Git-Flow ist ein strukturiertes Branching-Modell für Git, das Entwicklungsabläufe klar trennt und gleichzeitig stabile Releases unterstützt. Das Modell wurde 2010 von Vincent Driessen vorgestellt und wird vor allem in Projekten eingesetzt, in denen mehrere Features, Hotfixes und Versionen parallel entstehen.

Die ursprüngliche Beschreibung des Modells geht auf Driessen zurück @driessen2010gitflow.

Das Konzept basiert auf mehreren langlebigen Branches mit eindeutig definierten Aufgaben.
@Git-Flow-Grafik zeigt, wie diese Branches zusammenwirken und wo die eigentliche Entwicklung stattfindet. Ergänzend werden in @tabelle-Git-Flow die einzelnen Branches beziehungsweise Branch-Gruppen beschrieben.

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

Dieses System eignet sich besonders für strukturierte Abläufe mit klar definierten, umfangreicheren und aufeinander aufbauenden Releases. Für Rolling-Release-Ansätze ist es dagegen weniger passend, da die Zeitspanne bis zur Veröffentlichung tendenziell länger ist. Da in der #gls("O-SW") Releases primär an Projektmeilensteinen vorgesehen sind, ist Git-Flow für diesen Anwendungsfall gut geeignet.
 
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
))<tabelle-E-SW>

Das Word-Dokument enthält in @Git-Flow-E-SW und @tabelle-E-SW die Kernelemente einer angepassten Git-Flow-Variante. Der zentrale Unterschied besteht darin, dass Releases nicht in separaten release/\*-Branches vorbereitet, sondern in main erstellt und anschließend über einen release/\*-Branch veröffentlicht werden.
Abgesehen davon entsprechen die grundsätzlichen Vor- und Nachteile weitgehend dem klassischen Git-Flow-Modell.

== Zwischenfazit zur Branching-Wahl

Auf Grundlage der Gespräche mit Robin Hettel wurde festgehalten, dass die Einführung von Git-Flow sowohl fachlich sinnvoll als auch organisatorisch gewünscht ist. Der Hauptgrund liegt darin, dass Git-Flow für wenige, größere Releases besser geeignet ist als GitHub-Flow. Zudem ist der in @E-SW-Richtlinien genannte Vorteil für den vorliegenden Kontext weniger entscheidend, da Releases ausschließlich an Projektmeilensteinen stattfinden und der aktuelle, stabile Code-Stand im Vordergrund steht.


= Evaluation des Code-Review-Ansatzes


GitHub Copilot kann mehr leisten als reine Codevervollständigung. Das System kann Entwickler auch dabei unterstützen, bestehende Coding-Conventions im Alltag konsequenter einzuhalten. Während der Arbeit analysiert Copilot den jeweiligen Kontext, erkennt wiederkehrende Muster und orientiert sich an projektinternen Standards. Dadurch entstehen Vorschläge, die nicht nur funktional sind, sondern auch besser zum Stil des Projekts passen. Teams profitieren dadurch von konsistenterer Codequalität, weniger manuellen Nacharbeiten und einem effizienteren Review-Prozess.

Die Bedeutung strukturierter Code-Reviews für Qualitätssicherung und Teamzusammenarbeit ist in der Forschung breit belegt @bacchelli2013moderncodereview @mcintosh2016codereview.

== Rahmenbedingungen und Setup bei fpt

Bei fpt befindet sich der Einsatz von Copilot für Code-Reviews derzeit noch in einer Erprobungsphase. Um produktive Bereiche nicht zu beeinflussen, wurde dafür ein separates Test-Repository eingerichtet. Da Copilot bei Reviews nur auf Inhalte des jeweiligen Repositories zugreifen kann, müssen die Coding-Conventions dort lokal im .github-Ordner hinterlegt sein. Dies geschieht über .md-Dateien, die GitHub direkt gerendert darstellt. Damit Änderungen nicht manuell in jedes Repository verteilt werden müssen, wurde das in @CodingConventionDiagramm gezeigte Verteilungssystem aufgebaut. Jeder Block steht für ein Repository, die Pfeile repräsentieren GitHub Actions.

Die Funktionsweise von Pull-Request-Reviews und branchbezogenen Schutzmechanismen ist in der offiziellen GitHub-Dokumentation beschrieben @githubdocs_prreviews @githubdocs_protectedbranches.

Wenn sich Coding-Conventions ändern, wird im Übersichts-Repository eine GitHub Action ausgeführt, die die aktualisierten .md-Dateien an Bibliotheken und Template-Projekte verteilt. Da die Ziel-Repositories in den Workflows explizit hinterlegt werden müssen, können fortlaufend neu entstehende Projekt-Repositories nicht direkt auf diesem Weg gepflegt werden. Deshalb werden die notwendigen Actions im Template-Projekt abgelegt. Alle daraus abgeleiteten Projekte übernehmen diese automatisch und können die aktuellen Conventions zentral aus dem Übersichts-Repository abrufen.


#figure(image("assets/CodingConventionFlow.png", width: 90%), caption: "Coding-Convention Verteilung" )<CodingConventionDiagramm>

Diese Actions sind bereits in allen #gls("O-SW")-Repositories vorhanden, die nicht als Projekt-Repositories geführt werden. Die Abläufe wurden intensiv getestet. Auch die automatische Übernahme in neu erzeugte Projekte ist bereits umgesetzt.


Zusätzlich wurde im Test-Repository implementiert, dass Copilot bei jeder Pull Request auf main automatisch alle enthaltenen Commits gegen die hinterlegten Coding-Conventions prüft und Verbesserungsvorschläge liefert. Um die Zuverlässigkeit realistisch zu bewerten, wurden bewusst typische Fehler eingebaut. Aus den resultierenden Copilot-Antworten konnten mehrere Problemfelder abgeleitet werden.
Diese werden im Folgenden dargestellt, erläutert und hinsichtlich möglicher Lösungen bewertet.


== Testablauf

Zur Bewertung der Zuverlässigkeit von GitHub Copilot wurde im Test-Repository ein separater Branch angelegt, in den gezielt typische Programmierfehler eingebracht wurden. Anschließend wurde jeweils eine Pull Request in main geöffnet, um die konfigurierte Code-Review-Richtlinie auszulösen. Copilot analysierte die Änderungen und hinterließ entsprechende Kommentare.

Da Copilot auch die Pull-Request-Beschreibung und Diskussionen verarbeitet, wurde die Checkliste der absichtlich eingebauten Fehler jeweils erst nach Abschluss des Reviews ergänzt. So blieb die Auswertung nachvollziehbar und methodisch vergleichbar.

Wenn Anpassungen an Coding-Conventions oder Copilot-Anweisungen vorgenommen wurden, wurde die vorherige Pull Request geschlossen und eine neue erstellt. Damit konnte jede Änderung unter möglichst gleichen Rahmenbedingungen bewertet werden.


== Ergebnisse und Problemanalyse

=== Grundproblem

In den ersten Copilot-Reviews zeigte sich, dass die Gründlichkeit der Befunde nicht ausreichte. Nach eigener Recherche und Rücksprache mit GitHub Copilot Chat wurde deutlich, dass die zugrunde liegenden Coding-Conventions vermutlich nicht präzise genug formuliert waren. Deshalb wurden die Kapitel "#gls("TwinCat")" und "Allgemein" vollständig überarbeitet. Zur Unterstützung wurde der Microsoft-Copilot-Agent "Prompt Coach" genutzt, um die Regeln im vorhandenen Kontext verständlicher und KI-kompatibler zu formulieren. Die Überarbeitung betraf vor allem die sprachliche Präzisierung sowie ergänzende Copilot-Anweisungen.

Die durch KI erzeugten Vorschläge wurden anschließend von mehreren Personen inhaltlich geprüft und nur nach sorgfältiger Bewertung übernommen. Eine ungeprüfte oder automatische Übernahme erfolgte ausdrücklich nicht.

Zusätzlich erhielt jede Regel eine eindeutige ID, auf die GitHub Copilot in Befunden verweisen kann. Die Struktur folgt dem Muster Kapitelnummer-Fehlernummer im Kapitel, beispielsweise "3.2.7-2".

Nach diesen Anpassungen verbesserte sich die Qualität der Reviews deutlich. Dies zeigte sich unter anderem daran, dass Kapitel- und Regelreferenzen konsistent verwendet wurden und erkannte Probleme zumindest als unterdrückte Kommentare sichtbar wurden.

=== Problem Kommentarunterdrückung

Das zentrale Restproblem bestand darin, dass Copilot Benennungsregelverstöße für Variablentypen innerhalb von Structs nur eingeschränkt zuverlässig erkannte. Besonders betroffen war die Prüfung des Präfixes stc\_ für Struct-Typ-Variablen. In der Praxis wurden Verstöße zwar erkannt, die zugehörigen Kommentare jedoch häufig unterdrückt. Das Problem wurde gezielt reproduziert, indem im Testcode das erforderliche Präfix bei einem Variablentyp in einer Struct entfernt wurde. Zur Gegenmaßnahme wurden die relevanten Abschnitte der Coding-Conventions aus @VariableNaming in den Kontextdialog übernommen und auf dieser Basis die in @structKlausel gezeigte Zusatzklausel formuliert.

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


== Feedback und weitere Verbesserung

Nach der Umsetzung der Verbesserungen im Test-Repository wurde ein Abstimmungsgespräch mit Ralf Scheyerle geführt, der die Änderungen bewertete.
Dabei merkte er an, dass die Instructions in Teilen zu eng gefasst seien. Dadurch funktioniere Copilot zwar zuverlässig als Reviewer, seine spätere Nutzung als Coding Agent werde jedoch unnötig eingeschränkt. Da gerade diese Flexibilität für den produktiven KI-Einsatz wichtig ist, wurde empfohlen, die Anweisungen gezielt zu öffnen, ohne die Review-Qualität zu verlieren.

Im Anschluss wurden die Instructions entsprechend überarbeitet. Konkret wurde die Klausel entfernt, die das Verhalten zu stark auf reines Reviewing begrenzte. Außerdem wurden die überarbeiteten TwinCat-Instructions in das Übersichts-Repository übernommen. Damit kann der in @CodingConventionDiagramm dargestellte Verteilungsprozess nun sowohl für Coding-Conventions als auch für Copilot-Instructions einheitlich genutzt werden.

Außerdem wurde angemerkt, dass Copilot bei Pull-Request-Reviews nur die veränderten Zeilen lesen kann. Dies führt dazu, dass bereits vorhandener Code nicht überprüft wird. Das zeigt sich vor allem darin, dass Fehler, die schon im Template-Projekt vorliegen, nicht korrekt erkannt werden. Hier musste daher eine Lösung gefunden werden, um Bestandscode zu prüfen.

Zu diesem Zweck wurde in Zusammenarbeit mit Ralf Scheyerle ein Agent entwickelt, der große Datenmengen komplexen Bestandscodes analysieren kann. Dies wurde dadurch ermöglicht, dass Ralf bereits einen Agenten besitzt, der qualitativ hochwertige Agent-Anweisungen formulieren kann. Mithilfe dessen konnte dieser Reviewer erfolgreich erstellt werden. Dieser wurde auch sofort eingesetzt, um die Template-Projekte und Standard-Libraries, soweit möglich, von Coding-Conventions-Verstößen zu bereinigen.

= Entwicklungsumgebung

Bei der Entwicklungsumgebung wurde sich für den Texteditor VSCode in Kombination mit der TwinCat XAE Shell entschieden, da VSCode sich durch Extensions hervorragend erweitern lässt und sich so ideal auf die Anforderungen anpassen lässt. Außerdem ist es Open Source und braucht im Gegensatz zu einer großen IDE nur sehr wenig Resourcen.


== Dateiverwaltung

Die Dateiverwaltung fand bisher immer über den Windows Explorer statt. Da VSCode aber einen schönen Projektbaum bietet, soll die Dateiverwaltung hierher verlagert werden. Dies gibt auch den Vorteil, dass viele Funktionen wie z.B. auch die Github Source Verwaltung und bearbeiten von Textdateien, wie in den Projekt häufige XML's, alle in einem Programm kombiniert werden können. So kann eine schlanker und effizienter Entwicklungsprozess mit weniger offenen Programmen erreicht werden.

== SPS-Programmierung

Da Beckhoff SPS SourceCode, also TwinCat Programme nicht als Klartext abliegen, sondern im XML Format, können sie nicht in jedem Text Editor bearbeitet werden. Deshalb ist hier immer eine Beckhoff eigene IDE nötig. Deshalb wird die SPS-Programmierung nichtmehr wie zuvor in Visual Studio sondern in der TwinCat XAE Shell umgesetzt. Diese basiert auf Visual Studio, ist aber kostenfrei und in der Regel schneller. Außerdem sind neue Versionen von TwinCat in der Regel zuerst für die XAE Shell verfügbar, da diese von Beckhoff selbst herausgegeben wird. 

== GitHub Verwaltung

#lorem(30)


= Pilotierung im Projekt

Um die praxisnahe Integration der eingeführten Quality-Assurance-Protokolle zu bewerten, wurden diese in ein Projekt eingebracht, das sich noch in der Vorinbetriebnahme befand. Dazu wurde mit den Projektprogrammierern David Kromer und Alexandru Trusi ein Termin angesetzt, in dem die geplanten Methoden gemeinsam besprochen wurden. Insbesondere die Branching-Strategien wurden positiv bewertet, da beide Programmierer die in @Problematik beschriebenen Herausforderungen bereits aus ihrem Arbeitsalltag kannten.

Alexandru brachte zusätzlich den Vorschlag ein, neben Feature-Branches pro Entwickler jeweils einen eigenen Develop-Branch zu nutzen. So kann zunächst unabhängig gearbeitet werden, bevor stabile Zwischenstände per Pull Request in develop überführt werden.
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

=== Copilot Code-Review

Das Copilot-gestützte Code-Review wurde analog zum Test-Repository in den Projektkontext überführt. Pull Requests auf main werden dabei automatisch gegen die hinterlegten Coding-Conventions geprüft. Die Ergebnisse fließen als strukturierte Review-Kommentare in den Freigabeprozess ein und unterstützen die frühzeitige Erkennung von Abweichungen.

Das Code-Review wird bei jedem Pull Request auf main ausgelöst, um die Einhaltung der Coding-Conventions systematisch zu prüfen.


= Projektmanagementprozess mit ZenHub

ZenHub ist ein webbasiertes Projektmanagement-Werkzeug, das speziell auf Softwareentwicklungsprozesse zugeschnitten ist und sich direkt in GitHub integriert. Der zentrale Vorteil besteht darin, dass Aufgabenplanung und Quellcodeverwaltung in derselben Umgebung stattfinden. Dadurch entfallen Medienbrüche zwischen Ticket-System, E-Mail-Kommunikation und Repository-Verwaltung.

Die zugrunde liegenden Funktionsbausteine werden in der Herstellerdokumentation beschrieben @zenhub_docs.

Für die vorliegende Arbeit ist ZenHub vor allem deshalb relevant, weil neben der technischen Umsetzung auch die organisatorische Steuerung verbessert werden soll. Während Branching-Strategien und Code-Reviews primär die technische Qualität absichern, stärkt ZenHub die Prozessqualität: Priorisierung, Verantwortlichkeiten, Terminbezug und Transparenz über den Arbeitsfortschritt.

Funktional stellt ZenHub dafür mehrere Bausteine bereit:
- *Boards* zur operativen Steuerung der Aufgaben im Tagesgeschäft
- *Epics* zur Bündelung zusammenhängender Features oder Arbeitspakete
- *Roadmaps* zur zeitlichen Planung über mehrere Iterationen oder Meilensteine
- *Automatisierungen* für wiederkehrende Statuswechsel und Workflows

Insgesamt entsteht damit eine zentrale und nachvollziehbare Planungs- und Kommunikationsstruktur, die sowohl für kleine Teams als auch für bereichsübergreifende Zusammenarbeit geeignet ist.

== Aktueller Stand bei #gls("E-SW")

In der #gls("E-SW") wird ZenHub aktuell primär für die Release-Planung der firmeneigenen Nutzeroberfläche #gls("FlexOp") eingesetzt. Der Fokus liegt auf einer klaren Verbindung zwischen strategischer Planung (Roadmap und Epics) und operativer Umsetzung (Issues auf dem Board).

Der etablierte Ablauf in der #gls("E-SW") lässt sich wie folgt zusammenfassen:
- Neue Aufgaben werden als Issues erfasst und inhaltlich vorqualifiziert.
- Der Teamleiter Simon Würzer priorisiert diese Issues nach Dringlichkeit und fachlicher Relevanz.
- Anschließend werden die priorisierten Tickets in den Bearbeitungsprozess überführt und passenden Teammitgliedern zugewiesen.
- Umfangreichere Vorhaben werden als Epic angelegt und in umsetzbare Einzel-Issues zerlegt.
- Für geplante Releases werden feste Zeitpunkte in der Roadmap hinterlegt und die zugehörigen Issues entsprechend zugeordnet.

Dieser Ablauf schafft hohe Transparenz über Zuständigkeiten und Fortschritt. Gleichzeitig wird sichergestellt, dass operative Aufgaben jederzeit im Kontext übergeordneter Release-Ziele stehen.

== Übertragung auf die #gls("O-SW")

Die Übertragung auf die #gls("O-SW") verfolgt das Ziel, die bisher überwiegend mündliche und E-Mail-basierte Abstimmung durch einen standardisierten und nachvollziehbaren Prozess zu ersetzen. Insbesondere bei kurzfristigen Änderungen im Umfeld von #gls("FlexOp")-Versionen ist eine zentrale Planung erforderlich, um Abhängigkeiten frühzeitig sichtbar zu machen und den Abstimmungsaufwand zu reduzieren.

Ausgehend von den in der #gls("E-SW") etablierten Abläufen wird ZenHub in der #gls("O-SW") so eingesetzt, dass strategische Planung und operative Umsetzung enger verknüpft werden. Aufgaben werden als Issues erfasst, priorisiert und den verantwortlichen Mitarbeitenden zugeordnet. Umfangreichere Vorhaben werden in Epics gebündelt und in umsetzbare Einheiten unterteilt. Für zeitkritische Arbeitspakete erfolgt zusätzlich eine Zuordnung zu geplanten Meilensteinen.

// TODO: Hier den konkreten O-SW-Zielprozess mit Rollen, Board-Spalten, Priorisierungslogik und einem kurzen Praxisbeispiel ergänzen.
#lorem(70)

Durch dieses Vorgehen kann ZenHub nicht nur als reines Ticket-Tool genutzt werden, sondern als verbindendes Steuerungselement zwischen technischer Umsetzung, Branching-Prozess und Release-Kommunikation.


= Schulung und Wissenssicherung

Damit die zuvor beschriebenen Methoden im Team wirksam und regelkonform angewendet werden, werden im nächsten Schritt strukturierte Schulungsunterlagen erarbeitet. Diese sollen einerseits eine grundlegende Einführung in Git und GitHub für neue Mitarbeitende und Auszubildende bieten und andererseits die neu eingeführten Prozesse und Richtlinien vermitteln.

Die Dokumentation verfolgt dabei zwei Ziele: Erstens soll das Onboarding neuer Teammitglieder systematisch unterstützt werden, zweitens soll ein abteilungsweit einheitlicher Wissensstand etabliert werden.

== Aktuelles Wissen der Mitarbeiter

Zur bedarfsgerechten Ausgestaltung der Schulung wurde ein strukturierter Austausch mit dem Mitarbeiter Matthias Scheuring durchgeführt. Zum Zeitpunkt des Gesprächs verfügte er über geringe Vorerfahrung mit Git und GitHub, hatte jedoch bereits punktuelle Berührungspunkte in einem Projektkontext. Ziel des Termins war es, die aus Anwendersicht relevanten Einstiegshürden zu identifizieren und daraus priorisierte Schulungsinhalte abzuleiten.

Die inhaltlichen Ergebnisse werden im weiteren Projektverlauf noch vollständig konsolidiert. Als aktueller Arbeitsstand lassen sich folgende Schwerpunkte festhalten:
- Grundverständnis zu Git, GitHub und Versionshistorie
- Sicheres Arbeiten mit Branches, Pull Requests und Merges
- Orientierung im unternehmensspezifischen Ablaufmodell

In dem Gespräch mit Matthias nannte er einige Themen, welche ihm beim Einstieg in GitHub Probleme machten. Zunächst hatte er das Problem, dass er das Prinzip von Git nicht kannte und das Tool dessen nicht nutzte. Dadurch hatten andere Projektbeteiligte das Problem, dass sie ihn immer darum bitten mussten seinen Code zu commiten. #linebreak()
Desweiteren kannte er zu Beginn die Mechanik der Branches in Git nicht, was die Folge hatte, dass er commits nur in Main vornahm. Das führte wie in @ProblematikBranching beschrieben zu Konflikten im Code und mit anderen Programmierern.

Auf Basis dieser Erhebung wurden die im Folgenden beschriebenen Schulungsbausteine zusammengestellt.

== Wahl der Schulungsumgebung

Für die wirksame Vermittlung der Inhalte ist neben der fachlichen Aufbereitung auch die Auswahl geeigneter Lernumgebungen entscheidend. Die Bewertung erfolgte daher themenspezifisch.

=== Microsoft Learn

Microsoft Learn bietet etablierte Einstiegskurse zur Arbeit mit GitHub. Für den vorliegenden Anwendungsfall ist die Plattform jedoch nur eingeschränkt geeignet, da die Inhalte nicht an unternehmensspezifische Prozesse angepasst werden können. Zudem enthalten die Kurse teilweise Vorgehensweisen, die in der #gls("fpt Systems GmbH") nicht eingesetzt werden.

=== GitHub Skills

GitHub Skills stellt einen qualitativ hochwertigen Kurs bereit, der den Einstieg in GitHub und die dortigen Workspaces unterstützt. Im Rahmen einer Erprobung zeigte sich jedoch, dass der Schwerpunkt stark auf Workspace-basierten Szenarien liegt. Da in der #gls("O-SW") überwiegend mit #gls("TwinCat") und #gls("WorkVisual") gearbeitet wird, ist die direkte Übertragbarkeit auf den Zielkontext begrenzt.

=== YouTube <youtube>

Auf YouTube sind zahlreiche didaktisch gut aufbereitete Inhalte verfügbar, die Funktionen und Nutzung von Git und GitHub umfassend erläutern. Da diese Inhalte die unternehmensspezifischen Prozesse naturgemäß nicht abbilden, eignen sie sich nicht als alleinige Schulungsgrundlage. Als ergänzendes Einstiegsmedium sind sie jedoch sinnvoll.

=== Eigene Dokumentation

In der #gls("fpt Systems GmbH") existiert bereits ein HTML-basiertes Intranet-Wiki zur zentralen Bereitstellung von Wissensinhalten. Da die Schulungsunterlagen dort eigenständig erstellt und gepflegt werden können, ist diese Lösung besonders geeignet, um den unternehmensspezifischen Umgang mit Git und GitHub abzubilden. Zusätzlich können multimediale Ergänzungen wie Abbildungen und externe Verweise integriert werden. Dadurch lassen sich die in @youtube genannten Videos gezielt als ergänzende Lernressourcen einbinden.



== Umsetzung der Dokumentation

=== Git und GitHub Grundlagen


Die Dokumentation der Git- und GitHub-Grundlagen bildet den Einstieg für neue Mitarbeitende und Auszubildende. Behandelt werden die zentralen Konzepte der Versionsverwaltung, die Arbeit mit Branches sowie der Ablauf von Pull Requests und Reviews im Unternehmenskontext. Die Inhalte sind so aufgebaut, dass sie sowohl für das Onboarding als auch als Nachschlagewerk im laufenden Projektbetrieb genutzt werden können.

// TODO: Hier die endgültige Struktur der Dokumentation (Kapitel, Verweise, Medien) und den Rollout-Prozess ergänzen.
#lorem(65)


=== Branching Strategien


Im Schulungsbaustein zu Branching-Strategien wird das in dieser Arbeit eingeführte Vorgehen praxisnah vermittelt. Der Schwerpunkt liegt auf der eindeutigen Zuordnung von Branch-Typen, der strukturierten Nutzung von Pull Requests sowie der nachvollziehbaren Integration in develop und main. Ziel ist eine konsistente Anwendung der festgelegten Regeln im Tagesgeschäft.

// TODO: Hier die finalen Schulungsinhalte, Lernziele und Übungsaufgaben für den Baustein Branching einfügen.
#lorem(60)



= Fazit

Im Rahmen dieser Arbeit wurden für die identifizierten Problemfelder Branching, Management und Code-Review konkrete Maßnahmen konzipiert und in den Projektkontext überführt. Die Einführung eines angepassten Git-Flow-Modells, der Einsatz von Copilot-gestützten Reviews sowie die Einbindung von ZenHub adressieren sowohl technische als auch organisatorische Schwachstellen der bisherigen Arbeitsweise.

Die Einordnung der erwarteten Prozesswirkung kann ergänzend auf etablierten Befunden zu Delivery- und Team-Performance gestützt werden @forsgren2018accelerate.

Die durchgeführten Tests und Abstimmungen zeigen, dass die gewählten Ansätze grundsätzlich geeignet sind, Transparenz, Nachvollziehbarkeit und Qualität in der Zusammenarbeit zu erhöhen. Gleichzeitig wurde deutlich, dass die Wirksamkeit der Maßnahmen von klar formulierten Richtlinien, konsistenter Anwendung im Team und einer belastbaren Schulungs- und Dokumentationsbasis abhängt.

// TODO: Hier belastbare Abschlussbefunde (z. B. Beobachtungen, Kennzahlen, Grenzen und Ausblick) eintragen.
#lorem(80)

Insgesamt legt die Arbeit damit eine praktikable Grundlage für einen einheitlichen, GitHub-basierten Entwicklungs- und Steuerungsprozess in der #gls("fpt Systems GmbH").
