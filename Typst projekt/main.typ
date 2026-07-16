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

Die Kombination aus Versionskontrolle, nachvollziehbarer Historie und parallelen Entwicklungszweigen schafft eine robuste Grundlage für Teamarbeit.

In der Praxis hängt die Effektivität von GitHub stark von den gewählten Prozessen ab. Insbesondere prägen zwei Faktoren den Erfolg: erstens eine passende Branching-Strategie und zweitens ein funktionierendes Team-Management. Diese definieren, wie Features, Bugfixes und Releases vorbereitet und integriert werden, und zwar nicht nur technisch, sondern auch organisatorisch.

Eine gute Branching-Strategie allein genügt jedoch nicht. Ergänzend erforderlich ist strukturierte Aufgabenplanung im Team. Projektmanagement-Werkzeuge unterstützen dabei durch: transparente Priorisierung von Arbeitspaketen, klare Verantwortlichkeitszuweisung und sichtbare Fortschrittsverfolgung. Die Verzahnung mit Entwicklungsprozessen, automatisierten Workflows und übersichtlichen Boards schafft gemeinsames Verständnis für anstehende Aufgaben und potenzielle Engpässe. Dies fördert Zusammenarbeit und steigert Qualität sowie Implementierungsgeschwindigkeit.

Im industriellen Umfeld der Anlagenprogrammierung sind diese Anforderungen besonders ausgeprägt. Projekte bestehen aus langlaufenden Meilensteinen, mehreren beteiligten Rollen und einer hohen Abhängigkeit zwischen Softwareständen, Inbetriebnahme und Releaseplanung. Schon kleine Unklarheiten bei Branch-Zuständigkeiten, Review-Pfaden oder Freigaben können in dieser Konstellation zu Verzögerungen führen, weil Fehler oft erst in späteren Integrationsphasen sichtbar werden. Ein methodisch konsistenter Entwicklungsprozess ist deshalb nicht nur ein organisatorischer Vorteil, sondern ein zentraler Beitrag zur technischen Risikoreduktion.

Ziel dieser Arbeit ist die Konzeption und praktische Überführung eines GitHub-basierten Prozessmodells für die #gls("O-SW"). Im Fokus stehen drei zusammenhängende Handlungsfelder: erstens eine tragfähige Branching-Strategie für meilensteinorientierte Projekte, zweitens ein skalierbarer Code-Review-Ansatz mit KI-Unterstützung und drittens die organisatorische Einbettung über Team-Management und Schulung. Die Arbeit verfolgt dabei ausdrücklich einen anwendungsnahen Ansatz: Konzepte werden nicht nur theoretisch bewertet, sondern in Test- und Pilotphasen erprobt.

Die Abgrenzung liegt darin, dass keine vollständige Reorganisation aller Unternehmensprozesse vorgenommen wird. Stattdessen konzentriert sich die Untersuchung auf den Entwicklungs- und Freigabeprozess rund um GitHub, Copilot-Reviews, ZenHub-gestützte Planung sowie die Kombination aus VS Code und TwinCat XAE Shell. Themen wie allgemeine IT-Infrastruktur, unternehmensweite Governance außerhalb des Projektkontexts oder eine vollständige wirtschaftliche Kostenrechnung werden nur insoweit betrachtet, wie sie die technische Umsetzbarkeit der vorgeschlagenen Prozessbausteine direkt beeinflussen.

Zur didaktisch klaren Einordnung folgt die Arbeit der Abfolge Ausgangslage, konzeptioneller Lösungsansatz, fachliche Grundlagen, Evaluation im Testkontext, Pilotierung im Projekt, organisatorische Implementierung und Schulung sowie abschließendes Fazit.

= Forschungsfragen und Methodik

== Forschungsfragen

Um die Zielerreichung nachvollziehbar zu prüfen, werden die folgenden Forschungsfragen zugrunde gelegt:

- *F1:* Inwieweit verbessert ein angepasstes Git-Flow-Modell die Nachvollziehbarkeit und Stabilität von Integrations- und Freigabeprozessen in der #gls("O-SW")?
- *F2:* Welchen messbaren Beitrag leisten Copilot-gestützte Reviews zur Erkennung formaler Regelverstöße im Vergleich zur rein manuellen Prüfung?
- *F3:* Inwieweit reduziert die Einführung von ZenHub den organisatorischen Abstimmungsaufwand und erhöht die Transparenz über Verantwortlichkeiten, Prioritäten und Abhängigkeiten?
- *F4:* Unter welchen organisatorischen und technischen Randbedingungen ist das kombinierte Prozessmodell langfristig im Teamalltag tragfähig?

Die Kapitel sind entlang dieser Fragen strukturiert: F1 wird primär über Branching-Konzeption und Pilotierung beantwortet, F2 über die Evaluation des Review-Ansatzes, F3 über die Management- und ZenHub-Abschnitte sowie F4 über Einführung, Schulung, Limitationen und Wirtschaftlichkeitsbetrachtung.

== Methodisches Vorgehen

=== Untersuchungsdesign

Die Arbeit folgt einem anwendungsorientierten, iterativen Design mit den Phasen Analyse, Konzeption, Evaluation im Testkontext, Pilotierung im Projekt und organisatorischer Verstetigung. Methodisch handelt es sich um eine praxisnahe Fallstudie im industriellen Umfeld mit formativer Verbesserung über mehrere Iterationen.

Die Evaluation kombiniert qualitative und semiquantitative Elemente. Qualitativ werden Beobachtungen aus Reviews, Pilotbetrieb und Teamrückmeldungen ausgewertet. Semiquantitativ werden wiederkehrende Befundtypen, Review-Verhalten und Prozessindikatoren systematisch kategorisiert und zwischen Iterationen verglichen.

=== Datengrundlage und Auswertungseinheit

Die Datengrundlage umfasst:

- Pull-Request-Reviews und zugehörige Befunde aus dem Test-Repository.
- Beobachtungen und Rückmeldungen aus dem Pilotprojekt der #gls("O-SW").
- Prozessartefakte aus Branching-, Review- und Planungsabläufen (z. B. Branch-Strukturen, Boards, Merge-Verläufe).

Die Auswertungseinheit ist jeweils ein klar abgegrenzter Iterationszyklus beziehungsweise ein definierter Projektabschnitt. Dadurch bleiben Ursache-Wirkungs-Bezüge zwischen Maßnahme und beobachtetem Ergebnis nachvollziehbar.

=== Bewertungsmetriken

Zur Vergleichbarkeit werden die folgenden Metriken verwendet:

#figure(table(
  columns: (1.2fr, 2.8fr),
  inset: 8pt,
  align: (left, left),
  stroke: 0.5pt + gray,
  [*Metrik*], [*Bedeutung im Kontext dieser Arbeit*],
  [Review-Abdeckung], [Anteil der relevanten Änderungen, die im PR-Prozess durch Review-Regeln adressiert werden.],
  [Befundpräzision], [Grad der fachlich korrekten Zuordnung von Hinweisen zu konkreten Conventions.],
  [Unterdrückungsanfälligkeit], [Häufigkeit, mit der formal korrekte Hinweise aufgrund von Diff-Eigenschaften nicht sichtbar werden.],
  [Prozessdurchlauf], [Tendenz der Bearbeitungsdauer von Änderung bis Merge über standardisierte PR-Schritte.],
  [Koordinationsaufwand], [Erforderliche Abstimmungsintensität zwischen Rollen bei Priorisierung, Review und Freigabe.],
), caption: "Bewertungsmetriken für Evaluation und Pilotierung")<Metriken>

Die Metriken werden überwiegend als Trends (niedrig, mittel, hoch; verbessert, unverändert, verschlechtert) bewertet, sofern keine belastbaren numerischen Reihen vorliegen.


= Ausgangslage und Zielbild

== Problematik<Problematik>

=== Branching<ProblematikBranching>

In der Abteilung #gls("O-SW") existiert bislang keine verbindliche und einheitliche Vorgehensweise für GitHub-Branches. Obwohl die #gls("E-SW") Richtlinien bereits bei internen Bibliotheken und Template-Projekten eingesetzt werden, zeigt sich in der Praxis: Diese Vorgaben passen nicht auf die Anlagenentwicklung. Die Entwicklungsabläufe unterscheiden sich strukturell und inhaltlich, was zu alltagsprägenden Unklarheiten führt.

Ohne diese Passgenauigkeit treffen Entwickler Branching-Entscheidungen zunehmend individuell. Das führt zu uneinheitlichen Abläufen, erschwert die Nachvollziehbarkeit von Änderungen und erhöht das Konfliktrisiko beim Zusammenführen von Code. Gleichzeitig sinkt die Zusammenarbeitseffizienz, da gemeinsame Regeln keine durchgehende Anwendung finden.

Im Tagesgeschäft zeigt sich dies insbesondere bei der Frage, wann Änderungen direkt in develop integriert werden dürfen und wann zunächst in enger abgegrenzten Feature- oder Bugfix-Branches gearbeitet werden muss. Fehlen dafür verbindliche Kriterien, entstehen in einzelnen Projekten unterschiedliche Interpretationen. Dadurch wächst der Abstimmungsbedarf zwischen den Beteiligten, Pull Requests werden uneinheitlich vorbereitet und Freigabeentscheidungen werden stärker personenabhängig. Die Folge ist kein einzelner großer Fehler, sondern eine Vielzahl kleiner Reibungsverluste, die den Entwicklungsfluss über die Projektlaufzeit hinweg messbar verlangsamen.

=== Management

Im Bereich Management nutzt die #gls("O-SW") derzeit keine dedizierte Team-Management-Software. Die Release-Planung erfolgt vornehmlich über mündliche Absprachen und E-Mail-Verteiler. Dies ist in der Praxis fehleranfällig und nur begrenzt transparent. Zusätzlich entstehen Engpässe, wenn neue #gls("FlexOp")-Versionen verbreitet werden und notwendige Vorbereitung nicht rechtzeitig anläuft.

Insbesondere bei kurzfristigen Prioritätsänderungen fehlt ohne zentrales Board häufig die direkte Sicht auf Abhängigkeiten zwischen Aufgaben. Informationen liegen verteilt in Postfächern, Gesprächsnotizen oder Einzelsystemen vor und müssen manuell zusammengeführt werden. Das erhöht nicht nur den Koordinationsaufwand für Teamleitung und Entwickler, sondern erschwert auch eine belastbare Fortschrittsbewertung. Für einen stabilen Releaseprozess ist jedoch entscheidend, dass Verantwortlichkeiten, Status und nächste Schritte jederzeit eindeutig nachvollziehbar sind.

=== Code-Review

Bei der Codequalität zeigt sich trotz formulierter Coding-Conventions ein wiederkehrendes Problem: Falsch benannte Variablen und unzureichend dokumentierte Code-Passagen gelangen in Projekte. Die Ursache liegt darin, dass die Regelkontrolle bisher nur begrenzt und überwiegend manuell stattfindet. Für #gls("TwinCat") fehlen klassische Linter-Werkzeuge oder vergleichbare Lösungen, so dass automatisierte Qualitätssicherung deutlich erschwert ist.

Die manuelle Kontrolle ist fachlich notwendig, skaliert aber mit zunehmender Projektlast nur eingeschränkt. Reviewende müssen gleichzeitig auf funktionale Korrektheit, Lesbarkeit, Namenskonventionen und Dokumentationsqualität achten. Ohne unterstützende Automatisierung steigt damit das Risiko, dass formale Regelverstöße erst spät entdeckt werden oder im Zeitdruck unbeabsichtigt übersehen werden. Genau an dieser Stelle besteht ein hoher Hebel für KI-gestützte Reviews, sofern deren Ergebnisse nachvollziehbar und reproduzierbar in den Pull-Request-Prozess eingebettet werden.

=== Entwicklungsumgebung

In der #gls("O-SW") besteht das Problem fehlender Entwicklungsumgebung-Einheit. Die Ursache: Lizenzen der bisherigen Lösung sind abgelaufen; Kostengründe und lange Update-Zyklen machen Neuentwicklung erforderlich. Aktuell existiert kein etabliertes Nachfolgesystem.

Die bisherige Werkzeuglandschaft war über mehrere Anwendungen verteilt, sodass Dateiverwaltung, Versionskontrolle und Programmierung in getrennten Oberflächen stattfanden. Dieser Medienbruch erschwert konsistente Arbeitsabläufe, weil Kontextwechsel zwischen Tools zusätzliche Zeit benötigen und Fehlerquellen im Prozess erzeugen. Für eine belastbare Teamarbeit wird daher eine Umgebung benötigt, die den kollaborativen GitHub-Workflow unterstützt und gleichzeitig die technischen Anforderungen der SPS-Programmierung ohne Lizenzhürden abdeckt.

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

    Stabil: Änderungen nur aus feature/\* per PR
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

GitHub-Flow überzeugt vor allem durch seine geringe Einstiegshürde. Da nur zwei Branch-Typen existieren, ist der Lernaufwand minimal und neue Teammitglieder können schnell produktiv mitarbeiten. Die konsequente Nutzung von Pull Requests für jede Änderung fördert kontinuierliches Feedback und ermöglicht eine zügige Integration abgeschlossener Features direkt in den Main-Branch. Teams, die auf automatisierte Tests und Continuous Deployment setzen, profitieren davon besonders: Jede Änderung durchläuft den gleichen, klar definierten Pfad von der Entwicklung bis zur Auslieferung.

==== Nachteile

Der Fokus auf einfache, häufige Releases wird zum Nachteil, sobald eine Codebasis mehrere parallele Versionsstände unterstützen muss. Da kein eigenständiger Develop-Branch existiert, landen alle Änderungen unmittelbar in main. Bei größeren Teams oder komplexen Releases kann das zu einem instabilen Hauptzweig führen, wenn mehrere unfertige Features gleichzeitig integriert werden. Auch Hotfix-Szenarien bei bereits veröffentlichten Versionen lassen sich im Modell nicht sauber abbilden, da ein separater, produktionsnaher Branch fehlt.

==== Bewertung für den O-SW Kontext

Für die #gls("O-SW") ist GitHub-Flow wenig geeignet. Die Abteilung entwickelt Anlagensteuerungen, die an klar definierten Projektmeilensteinen freigegeben werden. Eine kontinuierliche Auslieferung findet nicht statt; stattdessen müssen einzelne Programmstände über längere Zeiträume stabil gehalten und unabhängig voneinander gepflegt werden können. Genau diese Anforderung, nämlich parallele stabile Versionsstände mit strukturierter Release-Vorbereitung, kann GitHub-Flow strukturell nicht erfüllen. Die fehlende Trennung zwischen laufender Entwicklung und freigegebenen Ständen würde die Nachvollziehbarkeit in der Projektdokumentation erschweren und das Risiko erhöhen, dass nicht freigegebene Änderungen in produktive Meilensteine einfließen. Strukturiertere Modelle wie Git-Flow sind daher für diesen Einsatzbereich zu untersuchen.

=== Git-Flow: Strukturiertes Branching für komplexe Releases <Git-Flow>

Git-Flow ist ein strukturiertes Branching-Modell, das Entwicklungsabläufe klar trennt und stabile Releases absichert. Vorgestellt 2010 von Vincent Driessen (@driessen2010gitflow), wird es in Projekten mit parallelen Features, Hotfixes und Versionen am häufigsten angewendet.

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

    Stabil: Änderungen nur aus release/\* per PR

    Änderungen in main müssen zurück in develop fließen.
  ],

  // develop
  [
    develop
  ],
  [
    Grundlage aller Entwicklungsbranches

    Stabil: Änderungen nur als PR
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

Dieses Modell unterstützt strukturierte Abläufe mit klar umrissenen, aufbauend verknüpften Releases. Für Rolling-Release-Ansätze ist es weniger geeignet, da die Verweildauer bis zur Freigabe tendenziell länger ist. Da die #gls("O-SW") Releases primär an Projektmeilensteinen anknüpft, ist Git-Flow für diesen Einsatzfall gut geeignet.

==== Vorteile

Git-Flow bietet eine klare strukturelle Trennung zwischen laufender Entwicklung, Release-Vorbereitung und hotfix-nahen Eingriffen. Durch den Develop-Branch bleibt der Integrationsstand jederzeit stabil, ohne dass fertige Features auf eine Freigabe warten müssen. Feature- und Bugfix-Branches isolieren einzelne Arbeitspakete so, dass parallele Arbeiten sich nicht gegenseitig blockieren. Der Release-Branch ermöglicht gezieltes Aushärten vor der Auslieferung, sodass finale Tests und Dokumentationsanpassungen stattfinden können, ohne den weiterlaufenden Entwicklungsfluss zu unterbrechen. Für Projekte mit mehreren aktiven Versionsständen lassen sich Hotfixes direkt auf Release-Branches aufsetzen und anschließend sauber in Develop zurückführen.

==== Nachteile

Die Stärken des Modells gehen mit einem höheren Verwaltungsaufwand einher. Die Anzahl parallel existierender Branches steigt mit Teamgröße und Projektlaufzeit schnell an. Ohne konsequente Pflege, insbesondere beim Zurückführen von Release- und Hotfix-Branches in Develop, entstehen leicht Divergenzen, die spätere Merges erschweren. Für sehr kleine Teams oder Projekte mit ausschließlich kurzen, inkrementellen Änderungen kann der zusätzliche Prozessaufwand unverhältnismäßig sein.

==== Bewertung für den O-SW Kontext

Für die #gls("O-SW") überwiegen die Vorteile von Git-Flow klar. Die meilensteingebundene Release-Struktur der Anlagenprogrammierung entspricht exakt dem Szenario, für das das Modell konzipiert wurde: Neue Features werden über Develop integriert und erst dann in einem dedizierten Release-Branch zur Auslieferung vorbereitet. Gleichzeitig bleibt die Möglichkeit erhalten, produktive Stände per Hotfix zu korrigieren, ohne die laufende Entwicklung zu gefährden. Da in der #gls("O-SW") bereits Erfahrung mit Git und GitHub besteht und die Richtlinien der #gls("E-SW") als Referenz vorliegen, ist der Einführungsaufwand überschaubar. Der Mehraufwand durch Branch-Verwaltung rechtfertigt sich durch die gewonnene Transparenz und Stabilität im Freigabeprozess.
 
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

    Stabil: Änderungen nur aus "develop" per PR  

    Änderungen in main müssen zurück in develop fließen.
  ],

  // develop
  [
    develop
  ],
  [
    Grundlage aller Entwicklungsbranches 

    Stabil: Änderungen nur als PR
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

Die Evaluation findet in einem separaten Test-Repository statt, das vollständig von den produktiven Repositories isoliert ist. Diese Trennung stellt sicher, dass experimentelle Anpassungen an Conventions und Instruktionen keine Auswirkungen auf laufende Projekte haben. Innerhalb des Test-Repositories werden die Coding-Conventions als Markdown-Dateien im Verzeichnis `docs` abgelegt, die Copilot-Instruktionen befinden sich als Markdown-Dateien im Verzeichnis `.github`. Copilot greift ausschließlich auf Inhalte des jeweiligen Repositories zu; externe Quellen oder projektübergreifende Kontexte werden nicht einbezogen.

Für die spätere produktive Nutzung ist eine zuverlässige Verteilung der Conventions und Instruktionen an alle relevanten Repositories entscheidend. Dazu wurde eine zentrale GitHub Action eingerichtet, die aktualisierte Conventions und Copilot-Instruktionen automatisch an alle Bibliotheks- und Template-Repositories der O-SW verteilt. Neue Projekte, die aus einem Template erstellt werden, erben diese Action automatisch, sodass kein manueller Einrichtungsaufwand entsteht. Der technische Mechanismus basiert auf den GitHub-Funktionen für PR-Reviews und geschützte Branches @githubdocs_prreviews @githubdocs_protectedbranches. @CodingConventionDiagramm illustriert den Verteilungsprozess.

#figure(image("assets/CodingConventionFlow.png", width: 90%), caption: "Coding-Convention Verteilung" )<CodingConventionDiagramm>

Zum Zeitpunkt der Evaluation sind die Actions in allen O-SW-Repositories mit Ausnahme der Projekt-Repositories vorhanden. Intensive Tests haben bestätigt, dass die automatische Übernahme beim Erstellen neuer Projekte aus Templates zuverlässig funktioniert.

=== Testmethodologie

Um aussagekräftige und vergleichbare Ergebnisse zu erzielen, wurde eine einheitliche Testmethodik festgelegt. Im Test-Repository löst jeder Pull Request auf main automatisch einen Copilot-Review aus. Für jeden Testzyklus wurden absichtlich typische Regelverstöße in den Code eingebaut, die den Conventions entsprechen, etwa falsche Variablenpräfixe, fehlende Kommentare oder abweichende Benennungsschemata. Die Bewertungscheckliste wurde erst nach Abschluss des Reviews hinzugefügt, um zu verhindern, dass Copilot durch den Listeninhalt beeinflusst wird und die Vergleichbarkeit zwischen den Iterationen gewahrt bleibt.

Wurde eine Iteration mit einer Anpassung der Conventions oder Instruktionen abgeschlossen, wurde der zugehörige Pull Request geschlossen und ein neuer erstellt. Dadurch startet jede Iteration unter vergleichbaren Bedingungen mit einem frischen Diff, was die Isolation der Änderungseffekte sicherstellt. Diese Vorgehensweise verhindert, dass nachträgliche Anpassungen am selben Pull Request die Bewertung der Review-Qualität verfälschen. Jede Iteration basiert damit auf einem klar abgegrenzten Testzustand mit nachvollziehbarer Historie.

Als Referenzbasis für die Iterationshistorie wurden die geschlossenen Pull Requests des Test-Repositories herangezogen.
Für die vorliegende Auswertung wurden 60 aktiv getestete und anschließend geschlossene Pull Requests berücksichtigt.

Die quantitative Detailauswertung in dieser Arbeit fokussiert jedoch bewusst auf den abgegrenzten Verlauf der virtuellen Inbetriebnahme im Projekt GIRA, um eine einheitliche Vergleichsbasis innerhalb desselben Projektabschnitts sicherzustellen.

== Evaluationsergebnisse und Verbesserungszyklen

=== Iteration 1: Präzision der Conventions

Der erste Evaluationszyklus zeigte, dass Copilot grundsätzlich in der Lage ist, Coding-Conventions zu prüfen, die Gründlichkeit der Reviews jedoch weit hinter den Erwartungen zurückblieb. Eine Analyse der Befunde ergab, dass die Coding-Conventions selbst nicht präzise genug formuliert waren, um von einem KI-System zuverlässig ausgewertet zu werden. Formulierungen wie „sollte gut benannt sein" oder „Kommentare sind erwünscht" lassen zu viel Interpretationsspielraum und führen zu inkonsistenten Ergebnissen.

Als Gegenmaßnahme wurden die Kapitel „TwinCat" und „Allgemein" der Coding-Conventions vollständig überarbeitet. Dabei kam der Microsoft-Copilot-Agent „Prompt Coach" zum Einsatz, der Formulierungen auf KI-Kompatibilität prüft und Verbesserungsvorschläge liefert. Jede Regel erhielt außerdem eine eindeutige ID nach dem Schema Kapitelnummer-Fehlernummer, beispielsweise „3.2.7-2". Diese Referenzierbarkeit ist entscheidend, weil Copilot im Review direkt auf die jeweilige Regel verweisen und den Befund damit eindeutig begründen kann. Alle KI-generierten Formulierungsvorschläge wurden anschließend von mehreren Personen inhaltlich geprüft; eine automatische Übernahme fand nicht statt.

Nach der Überarbeitung stieg die Erkennungsqualität deutlich. Befunde ließen sich eindeutig einer Regel zuordnen, was die fachliche Bewertung beschleunigte. Der Aufwand im Review verlagerte sich damit weg von der Grundsatzfrage, ob ein Hinweis überhaupt zutrifft, hin zur produktiveren Frage, wie die Korrektur effizient umgesetzt wird.

=== Iteration 2: Kommentarunterdrückung bei Umbenennungen

*Befund:* Copilot erkannte Struct-Variablen-Benennungsverstöße (z. B. fehlendes `stc_`-Präfix), GitHub unterdrückte Kommentare.

*Ursachenanalyse:* GitHub unterdrückt Meldungen bei:
- Dateien, die als "neu hinzugefügt" erscheinen (nach Umbenennung)
- Fehlender stabiler Diff-Verknüpfung für umbenannte Dateien
- Umbenennung als intentionale Änderung (Copilot "widerspricht" PR-Intent)

#figure(image("assets/Vorgaben-Variablen.png", width: 90%), caption: "Coding-Convention Variablen Präfixe" )<VariableNaming>

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
   enthält, sofern diese Zeile im Diff als geänderter `+`-Eintrag erscheint.

**Copilot DARF NICHT** als einzigen Fundort die umbenannte DUT-Datei selbst angeben,
da GitHub diese Kommentare als low-confidence unterdrückt.
```))<Klausel>

#figure(image("assets/AntiSuppressionWorkflow.svg", width: 110%), caption: "Anti Suppression Workflow")<AntiSuppressionWorkflow>

Damit werden Verstöße nicht nur an der Deklaration, sondern zusätzlich an der ersten Verwendung in einer nicht umbenannten Datei gemeldet. Die Wahrscheinlichkeit einer Unterdrückung durch GitHub sinkt dadurch deutlich. Dieser Ablauf ist in @AntiSuppressionWorkflow dargelegt.
Nach dem Test zeigte sich, dass die ursprünglichen Kommentare weiterhin teilweise unterdrückt wurden, Verstöße jedoch zusätzlich an der ersten Verwendung der betroffenen Variablen als Fehler erschienen. Da diese Fundstellen nicht in umbenannten Dateien lagen, blieben die entsprechenden Meldungen sichtbar.


=== Iteration 3: Balance zwischen Präzision und Agilität

Nachdem die Review-Qualität durch präzise Instruktionen deutlich verbessert worden war, stellte Ralf Scheyerle ein neues Problem fest: Die stark restriktiven Anweisungen engen Copilot bei der täglichen Entwicklungsarbeit ein. Als Code-Assistent soll Copilot flexibel auf unterschiedliche Anfragen eingehen können; durch die strikten Reviewing-Klauseln verhielt sich das System jedoch auch außerhalb von Pull Requests zu rigide und verweigerte sinnvolle Vorschläge, die nicht unmittelbar einer Coding-Convention zugeordnet werden konnten.

Die Lösung bestand darin, die restriktivste Reviewing-Klausel aus den Instruktionen zu entfernen und die verbleibenden Anweisungen sprachlich zu öffnen, ohne die Kernaussagen zur Regelprüfung aufzugeben. Entscheidend war dabei, dass die Qualität der Befunde im Review-Betrieb erhalten blieb, während Copilot im Assistenzmodus wieder mit größerer Freiheit agieren konnte.

Die überarbeiteten TwinCat-Instructions wurden anschließend ins Übersichts-Repository übernommen und über den bestehenden Verteilungsprozess in alle relevanten Repositories propagiert (vgl. @CodingConventionDiagramm). Damit gilt für Conventions und Instructions derselbe zentrale Aktualisierungsweg. Diese Balance zwischen Präzision im Review und Flexibilität als Assistent erwies sich als wichtige Voraussetzung für die spätere Akzeptanz im Team.

=== Iteration 4: Bestandscode-Analyse

Die bisherigen Iterationen hatten sich ausschließlich auf die Prüfung von Pull Requests konzentriert. Dabei wurde ein struktureller blinder Fleck sichtbar: Copilot wertet im PR-Review nur die veränderten Zeilen des Diffs aus. Code, der bereits vor Einführung der Conventions im Repository lag, insbesondere in Template-Projekten und Standard-Libraries, bleibt dadurch vollständig unkontrolliert. Regelverstöße im Bestandscode akkumulieren sich damit unbemerkt und können erst bei einer expliziten Änderung der betroffenen Stellen auffallen.

Um diese Lücke zu schließen, wurde in Zusammenarbeit mit Ralf Scheyerle ein spezialisierter Agent entwickelt, der eine vollständige Analyse ausgewählter Repositories durchführt, unabhängig von Pull Requests. Der Agent bezieht das gesamte Repository als Kontext ein, prüft alle relevanten Dateien gegen die aktuellen Coding-Conventions und legt die Befunde strukturiert ab. Im Anschluss an die Entwicklung wurde der Agent unmittelbar auf Template-Projekte und Standard-Libraries angewendet.

Diese Ergänzung schließt die methodische Lücke der reinen PR-basierten Prüfung. Beide Ansätze ergänzen sich dabei: Pull-Request-Reviews sichern den Entwicklungsfluss kontinuierlich ab, während der Bestandscode-Agent dafür sorgt, dass auch historisch gewachsene Regelverstöße systematisch erfasst und schrittweise in den definierten Standard überführt werden können, ohne den laufenden Betrieb zu unterbrechen.

=== Zusammenfassende Bewertung der Iterationen

Zur konsistenten Einordnung werden die vier Iterationen entlang der in @Metriken definierten Kriterien zusammengeführt.

#figure(table(
  columns: (1.3fr, 2.0fr, 1.4fr, 1.5fr),
  inset: 8pt,
  align: (left, left, left, left),
  stroke: 0.5pt + gray,
  [*Iteration*], [*Ziel der Anpassung*], [*Befundpräzision*], [*Unterdrückungsanfälligkeit*],
  [1], [Präzisere und referenzierbare Conventions], [deutlich verbessert], [unverändert],
  [2], [Sichtbarkeit bei Umbenennungen erhöhen], [stabil], [verbessert, aber nicht eliminiert],
  [3], [Review-Präzision mit Assistenz-Flexibilität balancieren], [hoch], [unverändert],
  [4], [Bestandscode außerhalb von PR-Diffs erfassen], [hoch bei Vollanalyse], [nicht PR-diff-abhängig],
), caption: "Iterationsvergleich entlang zentraler Evaluationsmetriken")<Iterationsvergleich>

In Summe zeigt @Iterationsvergleich eine klare Reifung des Ansatzes: Die fachliche Präzision steigt über die Iterationen konsistent an, während plattformbedingte Einschränkungen gezielt durch Prozessmaßnahmen kompensiert werden.

== Zwischenfazit zur Evaluation

Die vier Iterationen zeigen einen klaren Entwicklungspfad. Ausgangspunkt war ein System, das grundsätzlich funktionsfähig, aber in seiner Prüftiefe unzureichend war. Der entscheidende Hebel lag nicht in der KI-Technologie selbst, sondern in der Qualität der zugrunde liegenden Conventions und Instruktionen: Erst präzise, eindeutig referenzierbare Regeln ermöglichten reproduzierbare und fachlich verwertbare Befunde.

Die zweite Iteration machte deutlich, dass die Qualität eines Reviews nicht allein von Copilot abhängt, sondern auch von der Plattform GitHub. Das Unterdrücken von Befunden bei umbenannten Dateien ist ein inhärentes Verhalten der GitHub-Diff-Auswertung und lässt sich nicht durch Instruktionsänderungen allein beheben. Die entwickelte Anti-Suppression-Strategie adressiert dieses Problem auf Prozessebene, indem Befunde an zusätzlichen, nicht betroffenen Fundstellen platziert werden.

Iteration 3 belegt, dass Präzision und Flexibilität keine Gegensätze sind, wenn Instruktionen zielgerichtet formuliert werden. Die Trennung zwischen verbindlichen Review-Verhaltensregeln und allgemeinen Assistenzfunktionen erlaubt es, beide Anforderungen gleichzeitig zu erfüllen.

Die vierte Iteration schließlich erweitert den Anwendungsbereich über den Pull-Request-Prozess hinaus. Damit ist die Qualitätssicherung nicht länger auf den Moment der Codeänderung beschränkt, sondern kann retrospektiv auf den gesamten Bestand angewendet werden. Für die praktische Einführung in der O-SW bedeutet das, dass Bestandsprojekte und Bibliotheken systematisch nachbereitet werden können, ohne den laufenden Entwicklungsbetrieb zu unterbrechen.

In der Gesamtschau ist festzuhalten: KI-gestützte Code-Reviews sind ein wirksames Werkzeug zur Qualitätssicherung im TwinCat-Umfeld, setzen aber eine sorgfältige Pflege der Conventions und Instruktionen voraus. Die erarbeiteten Prinzipien Präzision, Referenzierbarkeit, gezielte Unterdrückungsvermeidung und Bestandsbereinigung bilden die Grundlage für den stabilen Einsatz im Pilotprojekt.

= Entwicklungsumgebung

Die Entwicklungsumgebung kombiniert VS Code und TwinCat XAE Shell. VS Code lässt sich über Extensions flexibel an Projektanforderungen anpassen, ist Open Source und ressourcenschonend.

Entscheidend ist jedoch nicht nur die Tool-Auswahl, sondern ein einheitlicher Ablauf. Daher werden Dateiverwaltung, SPS-Programmierung und GitHub-Verwaltung im Folgenden prozessorientiert beschrieben.


== Dateiverwaltung

Die Dateiverwaltung erfolgte bisher überwiegend im Windows Explorer. Künftig wird sie in VS Code gebündelt, um Projektstruktur, Textartefakte und Versionsstatus in einer Oberfläche zu führen.

*Soll-Ablauf:*
- Projekt lokal öffnen und Verzeichnisse im VS Code Explorer verwalten
- Relevante Textartefakte (z. B. XML-Dateien) direkt im selben Arbeitsfenster bearbeiten
- Änderungen im Source-Control-Bereich prüfen, dann committen

Der Wechsel zwischen Explorer, separatem Git-Client und Editor entfällt. Das erhöht Effizienz und Nachvollziehbarkeit.

Zusätzlich verbessert die Bündelung in VS Code die Einarbeitung neuer Mitarbeitender: Wiederkehrende Aufgaben wie Dateivergleich, Suche, Commit-Vorbereitung und PR-Navigation folgen einem einheitlichen Bedienmuster. Dadurch sinkt die Abhängigkeit von individuellen Tool-Präferenzen einzelner Teammitglieder.

== SPS-Programmierung

TwinCat-Programme liegen XML-basiert vor und lassen sich nicht sinnvoll in beliebigen Editoren bearbeiten. Auch Kompilierung, Steuerungs-Upload und Debugging erfordern Beckhoff-spezifische Werkzeuge.

Daher erfolgt die SPS-Programmierung in der TwinCat XAE Shell statt in Visual Studio. Die XAE Shell ist kostenfrei, in der Praxis oft performanter und erhält neue TwinCat-Versionen in der Regel zuerst.

*Rollenverteilung der Werkzeuge:*
- VS Code: Projektorganisation, Versionsverwaltung, Reviews, begleitende Textartefakte
- TwinCat XAE Shell: SPS-Programmierung und Bearbeitung der projektspezifischen XML-Inhalte


Diese Trennung reduziert Tool-Konflikte. Fachliche Änderungen entstehen in der XAE Shell, kollaborative Schritte laufen in VS Code und GitHub.

#figure(image("assets/AenderungBisPR.svg", width: 80%), caption: "Workflow: Änderung in XAE Shell bis Pull Request")<SPS-Workflow>

== GitHub Verwaltung

Die GitHub-Verwaltung erfolgte bisher vor allem über Sourcetree oder GitHub Desktop. In VS Code steht jedoch bereits eine integrierte Oberfläche für pull, push, commit, checkout, Branch-Auswahl, Arbeitsbaum und Änderungsverwaltung bereit.


#figure(image("assets/VS-Code-SourceControl.png", width: 50%), caption: "VS-Code Source Verwaltung" )<VS-Code-SourceControl>

Das Interface ist über die Seitenleiste jederzeit erreichbar (vgl. @VS-Code-SourceControl). Für Issues, Actions und Pull Requests ergänzen die empfohlenen Extensions "GitHub Pull Requests" und "GitHub Actions" den Funktionsumfang.

*Durchgängiger Tagesablauf:*
- Lokalen Stand synchronisieren (fetch/pull) und auf den Arbeitsbranch wechseln
- Änderung umsetzen und den Arbeitsbaum fortlaufend prüfen
- Commit und Push in VS Code, danach Pull Request erstellen oder aktualisieren
- Review und Freigabe über die Integration, anschließend Merge in den Zielbranch

Diese integrierte Vorgehensweise reduziert Medienbrüche und stärkt Pull-Request-basierte Freigaben sowie nachvollziehbare Änderungsverläufe.

Für den Tagesbetrieb bedeutet das eine klare Trennung von fachlicher Umsetzung und Freigabeschritten: Änderungen entstehen in den jeweiligen Arbeitswerkzeugen, werden aber zentral in GitHub-konformen Abläufen dokumentiert, geprüft und integriert. Insbesondere bei parallel laufenden Arbeitspaketen steigt dadurch die Planbarkeit der Merge-Reihenfolge.


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

Die Einführung der Branching-Strategie verlief im Projektverlauf insgesamt stabil. Die Projektprogrammierer David Kromer und Alexandru Trusi hielten die Branch-Struktur im Wesentlichen ein; Feature-Branches wurden für neue Funktionen angelegt und über Pull Requests in den gemeinsamen Develop-Branch integriert. Merge-Konflikte traten auf, ließen sich jedoch durch die klare Branch-Abgrenzung schneller lokalisieren und auflösen als in vorherigen Projekten ohne einheitliche Konventionen.

Als besonders positiv wurde festgehalten, dass der Pull-Request-Übergang als natürlicher Kontrollpunkt wirkt: Bevor Code in Develop einfließt, findet eine explizite Prüfung statt. Dadurch werden Fehler und Inkonsistenzen früher sichtbar, bevor sie sich in nachgelagerten Integrationsphasen auswirken.

Als Herausforderung zeigte sich der anfängliche Mehraufwand in der Einarbeitungsphase. Das konsequente Anlegen und Benennen von Branches sowie das Vorbereiten reviewfähiger Pull Requests erfordert Disziplin und erhöht zunächst den Zeitaufwand pro Änderung. Dieser Aufwand relativiert sich mit zunehmender Routine; er ist als Investition in die langfristige Transparenz und Nachvollziehbarkeit zu verstehen.

Im Projektverlauf wurde außerdem festgestellt, dass die Coding-Conventions auskommentierten Code als Regelverletzung werten. Da vorübergehend deaktivierter Code in der Entwicklungsphase jedoch ein reguläres Mittel ist, wurde in Absprache mit dem Team eine pragmatische Regel eingeführt: In develop darf auskommentierter Code verbleiben, sofern er mit einem `{warning 'ToDo:'}`-Tag kenntlich gemacht wird. In Branches auf main-Richtung bleibt die ursprüngliche Regel weiterhin gültig.

Zusätzlich wurde identifiziert, dass `.tmc`-Dateien (TwinCat-Maschinenkonfigurationen) in die `.gitignore` aufgenommen werden sollten. Diese Dateien enthalten maschinenspezifische Einstellungen, die nicht projektübergreifend versioniert werden sollen und bei fehlendem Eintrag zu unerwünschten Konflikten im Repository führen können.


=== Copilot Code-Review

Das Copilot-gestützte Code-Review läuft analog zum Test-Repository. Jeder PR zu main wird automatisch gegen die Coding-Conventions geprüft; Befunde integrieren sich direkt in den Freigabeprozess.

==== Erfahrungen und Probleme

Das Projekt lief regulär mit einem Unterschied: Jeder PR zu main löste automatisch einen Copilot-Review aus.

Nach dem ersten Meilenstein (Virtuelle Inbetriebnahme) zog Alexandru folgende Bilanz:
- Rechtschreibfehler: Zuverlässig erkannt, automatischer Resolve funktioniert
- Falsch-Positive: Manchmal Meldungen für Variablen, die in FUP tatsächlich verwendet werden
- Schweregrad-Einstufung: Copilot überschätzt manchmal die Kritikalität von Fehlern
- Syntaxfehler in Vorschlägen: Strukturelle Verbesserungen erfordern teils manuelle Nachprüfung
- Strukturelle Befunde: Copilot erkannte einen Strukturfehler im Code korrekt; der zugehörige automatische Verbesserungsvorschlag war jedoch syntaktisch fehlerhaft und hätte nicht direkt übernommen werden dürfen. Als Konsequenz wurde die Funktion „Commit Suggestion" deaktiviert, um ungeprüfte automatische Korrekturen zu verhindern.
- Kommentarvorschläge: Bei Rechtschreib- und Formulierungsfehlern in Kommentaren lieferte Copilot konsistent gute und direkt anwendbare Verbesserungsvorschläge.

Diese Rückmeldung deckt sich mit den Beobachtungen aus der Evaluation: Copilot liefert einen messbaren Mehrwert bei formalen und sprachlichen Qualitätsaspekten, benötigt bei domänenspezifischen SPS-Kontexten jedoch weiterhin menschliche Plausibilisierung. Besonders bei FUP-bezogenen Verwendungsstellen ist der semantische Kontext nicht immer vollständig ableitbar, was zu vereinzelten Falsch-Positiven führt.

Für den Pilotbetrieb wurde deshalb ein pragmatischer Umgang festgelegt: Kritische oder strukturelle Empfehlungen werden als Prüfhinweis behandelt und erst nach manueller Verifikation umgesetzt; klar nachvollziehbare Formalverstöße können direkt korrigiert werden. Dadurch bleibt der Nutzen des automatisierten Reviews erhalten, ohne ungeprüfte Änderungen in den Codebestand zu übernehmen. Alexandru beurteilte den Gesamtnutzen nach dem ersten Meilenstein als positiv: Der Review-Aufwand für formale Aspekte sank spürbar, während der fachlich inhaltliche Review weiterhin manuell bleibt. Dieses Zusammenspiel aus automatisierter Formalkontrolle und menschlicher Fachkontrolle erwies sich als praxistaugliches Modell für die weitere Projektarbeit.

Zur semiquantitativen Einordnung wurde für den Verlauf der virtuellen Inbetriebnahme im Projekt GIRA folgende Stichprobe betrachtet (n = 40 Copilot-Befunde):

#figure(table(
  columns: (2.2fr, 1fr, 1fr),
  inset: 8pt,
  align: (left, right, right),
  stroke: 0.5pt + gray,
  [*Kategorie*], [*Anzahl*], [*Anteil*],
  [Korrekt erkannte Befunde], [25], [62,5 %],
  [Manuelle Prüfung erforderlich], [13], [32,5 %],
  [Falsch-Positive], [2], [5,0 %],
  [*Summe*], [*40*], [*100 %*],
), caption: "Semiquantitative Befundauswertung (GIRA, virtuelle Inbetriebnahme)")<GiraBefunde>

Die 2 Falsch-Positiven traten überwiegend in Situationen auf, in denen Copilot FUP-Kontexte in TwinCat nicht eindeutig interpretieren konnte. Die 13 manuell zu prüfenden Befunde entstanden bis auf 2 Fälle durch temporär auskommentierten Code oder projektbedingte Workarounds während der Entwicklungsphase.

Für diesen Fall wurde eine verbindliche Teamregel festgelegt: Auskommentierter Code ist in der Entwicklungsphase zulässig, sofern direkt darüber ein `{warning 'ToDo:'}`-Hinweis steht, dass der betroffene Abschnitt vor Release entweder entfernt oder wieder in Betrieb genommen werden muss. Dieser Hinweis sorgt innerhalb der XAE Shell für eine Warnung im Fehlerfenster. Dies wurde im Anschluss auch in den Copilot Anweisungen eingearbeitet, dass hier bei einem PR in develop kein Fehler angemerkt wird.

Ergänzend wurde aus vergleichbaren Projekten ähnlicher Größenordnung eine explizite Schätzung dokumentiert: Ohne den eingeführten Review-Ansatz verbleiben schätzungsweise rund 100 kleinere Benennungs- und Rechtschreibfehler (Variablen und Kommentare) zunächst unentdeckt und werden häufig erst in späteren Wartungsphasen sichtbar. Diese Zahl ist als Erfahrungswert zu verstehen und variiert zwischen Entwicklern und Projekten teils deutlich. Im neuen Ablauf wurden solche formalen Fehler im betrachteten Projektabschnitt nicht mehr als spätere Wartungsbefunde festgestellt, da sie bereits im PR-Prozess adressiert wurden. 
Allerdings kann mit sehr hoher Sicherheit sagen, dass durch die neuen Review-Abläufe keine Strukturfehler mehr vorhanden sind, die unter ganz bestimmten, und nicht beachteten Umständen, zu Fehlern geführt hätten.

Zeitlich zeigt sich im Pilotbetrieb eine Verschiebung des Aufwands: Reviews auf `feature/* -> develop` dauern tendenziell länger als zuvor, da sie vorher nicht vorhanden waren, während Reviews auf `develop -> main` deutlich entlastet werden und statt mehrerer Stunden in der Regel unter einer Stunde abgeschlossen werden können.

= Projektmanagement mit ZenHub

ZenHub ist ein webbasiertes Projektmanagement-Tool für Softwareentwicklung, das direkt in GitHub integriert ist (vgl. @zenhub_docs). Der zentrale Vorteil liegt darin, dass Aufgabenplanung und Quellcodeverwaltung in einer gemeinsamen Oberfläche zusammengeführt werden. Medienbrüche zwischen Ticket-System, E-Mail-Kommunikation und Repository entfallen dadurch vollständig: Entwickler können Issues direkt mit Branches und Pull Requests verknüpfen, ohne zwischen verschiedenen Plattformen wechseln zu müssen.

Für die O-SW ist ZenHub ein strategisches Ergänzungselement zu den technischen Prozessverbesserungen. Während Branching-Strategien und Code-Reviews die technische Qualität der Entwicklungsartefakte sichern, adressiert ZenHub die organisatorische Seite: Welche Aufgabe hat welche Priorität? Wer ist verantwortlich? Wann ist ein Release geplant? Diese Fragen lassen sich ohne ein zentrales Planungswerkzeug nur schwer transparent und verbindlich beantworten.

ZenHub stellt dafür vier funktionale Bausteine bereit. Boards ermöglichen die operative Steuerung des Tagesgeschäfts, indem Issues per Drag-and-Drop durch konfigurierbare Spalten bewegt werden. Epics bündeln thematisch verwandte Issues zu übergeordneten Arbeitspaketen und ermöglichen damit eine strukturierte Fortschrittsverfolgung auf Funktions- oder Meilensteinebene. Roadmaps stellen die zeitliche Planung über Iterationen und Releases hinweg dar und machen Abhängigkeiten und kritische Pfade sichtbar. Automatisierungen schließlich reduzieren manuellen Verwaltungsaufwand, indem Statuswechsel regelbasiert ausgelöst werden, etwa wenn ein zugehöriger Pull Request gemergt wird.

 Die Kombination dieser Bausteine schafft eine zentrale, nachvollziehbare Planungs- und Kommunikationsstruktur, die unabhängig von Teamgröße skaliert.

== E-SW Prozess als Referenz

In der E-SW steuert ZenHub primär die Planung und Durchführung von FlexOp-Releases. Der etablierte Ablauf beginnt mit der Erfassung und Vorqualifizierung von Issues durch die Entwickler. Teamleiter Simon Würzer übernimmt anschließend die Priorisierung anhand von Dringlichkeit und fachlicher Bedeutung. Priorisierte Tickets werden konkreten Entwicklern zugeordnet und fachlich eingewiesen. Größere Vorhaben, die mehrere zusammenhängende Arbeitsschritte umfassen, werden als Epics angelegt und in einzelne Issues unterteilt. Release-Zeitpunkte werden in der Roadmap hinterlegt und den zugehörigen Issues zugeordnet, sodass jederzeit erkennbar ist, welche Pakete für welchen Release eingeplant sind.

Im Tagesgeschäft hat sich dabei besonders die Kombination aus Epic-Struktur und Board-Status bewährt. Auch wenn kurzfristig umpriorisiert werden muss, bleibt für alle Beteiligten sichtbar, welche Arbeitspakete zu welchem Release-Ziel gehören und welche Abhängigkeiten noch offen sind. Dadurch kann die Teamleitung kurzfristige Entscheidungen treffen, ohne den Gesamtfortschritt aus dem Blick zu verlieren. Die direkte Verknüpfung von Issues mit Branch-Namen, beispielsweise `feature/Fx.FlexOP-1640_SSI-Packagerstellung`, stellt außerdem sicher, dass technische Umsetzung und Planungsstand jederzeit konsistent bleiben.

== Übertragung auf die O-SW

Ziel der ZenHub-Einführung in der O-SW ist es, die bisher mündlich und per E-Mail koordinierten Planungsprozesse durch einen standardisierten, nachvollziehbaren Ablauf zu ersetzen. Dies ist insbesondere dann relevant, wenn kurzfristige Versionsänderungen an FlexOp Auswirkungen auf SPS-Projekte haben: Abhängigkeiten werden früh sichtbar, der Abstimmungsaufwand sinkt, und Priorisierungsentscheidungen lassen sich transparent dokumentieren.

Das konkrete Vorgehen sieht vor, dass Issues für alle relevanten Arbeitspakete in GitHub angelegt, priorisiert und Verantwortlichen zugeordnet werden. Größere Vorhaben, etwa die Weiterentwicklung einer Standardbibliothek oder die Vorbereitung eines Template-Releases, werden als Epics strukturiert und in handhabbare Einzelissues unterteilt. Zeitkritische Pakete werden Meilensteinen zugeordnet, um die Release-Abhängigkeiten zwischen O-SW und E-SW sichtbar zu machen.

Für die Board-Konfiguration wurden Spalten nach dem Muster Backlog → Planned → In Progress → Review → Done festgelegt. Diese Aufteilung spiegelt den tatsächlichen Arbeitsfluss wider: Ein Issue wandert von der Erfassung über die aktive Bearbeitung durch die Code-Review-Phase bis zur abgeschlossenen Integration. Die Rollen wurden klar definiert: Priorisierung und Release-Freigabe liegen bei der Teamleitung, die operative Aufgabenverwaltung bei den Entwicklern.

ZenHub fungiert damit nicht als isoliertes Ticket-System, sondern als Verbindungselement zwischen technischer Umsetzung, Branching-Prozess und Release-Kommunikation. Issues, Pull Requests und Branches lassen sich in einem durchgängigen Ablauf verknüpfen, sodass Planungs- und Entwicklungsstand jederzeit konsistent und für alle Beteiligten einsehbar bleiben. Für die O-SW ist entscheidend, dass ZenHub nicht als administrativer Overhead verstanden wird, sondern als operatives Steuerungsinstrument, das den bestehenden GitHub-Workflow gezielt ergänzt.

== Zwischenfazit zum Projektmanagement

*Erkenntnis:* Die Kopplung von ZenHub mit Branching- und Review-Prozessen verbessert die organisatorische Steuerbarkeit, weil Planungs- und Entwicklungszustände auf denselben Artefakten aufbauen.

*Implikation:* Besonders wirksam ist die Einführung dann, wenn Rollen für Priorisierung, Bearbeitung und Freigabe verbindlich definiert sind und Board-Status diszipliniert gepflegt werden.


= Schulung und Wissenssicherung

Damit die Methoden wirksam und konsistent greifen, entstehen strukturierte Schulungsunterlagen. Sie unterstützen das Onboarding neuer Mitarbeitender und etablieren abteilungsweit einheitliche Standards.

== Bedarfsermittlung

Im Vorfeld der Schulungsplanung fand ein Austausch mit dem Mitarbeiter Matthias Scheuring statt, der repräsentativ für die Zielgruppe der Schulungsmaßnahmen steht: erfahrene SPS-Programmierer mit Projektberührung, aber geringer Vorerfahrung im Bereich Git und GitHub.

Das Gespräch ergab drei zentrale Einstiegshürden. Das Grundverständnis für Git und GitHub war nicht ausreichend vorhanden, was dazu führte, dass die Werkzeuge nicht konsequent eingesetzt wurden. In der Praxis äußerte sich das in wiederkehrenden Rückfragen, wie Commits korrekt durchgeführt werden. Das ist ein deutlicher Hinweis darauf, dass die grundlegende Mechanik noch nicht sicher verankert war.

Die Branch-Mechanik bereitete anfangs ebenfalls Schwierigkeiten. Ohne ein klares Verständnis davon, wozu Branches dienen und wie sie sich voneinander abgrenzen, wurden Commits direkt in main vorgenommen. Dies führte zu Konflikten im Code und im Team, wie in @ProblematikBranching beschrieben.

Als dritte Hürde fehlte der Unternehmenskontext: Es war unklar, warum bestimmte Prozesse so gestaltet sind, welche Konventionen für die O-SW gelten und wie der eigene Arbeitsschritt in den Gesamtprozess eingebettet ist. Ohne dieses Prozessverständnis werden selbst bekannte Werkzeuge nicht korrekt angewendet, weil die Konsequenzen von Abweichungen nicht einschätzbar sind.

Aus dieser Analyse ergeben sich drei Schulungsbausteine, die aufeinander aufbauen und sowohl technische Kenntnisse als auch prozessuales Verständnis vermitteln.

== Schulungsumgebung: Evaluierte Optionen

Bei der Wahl des Schulungsformats wurden mehrere externe und interne Optionen gegenübergestellt. Microsoft Learn bietet etablierte, gut strukturierte GitHub-Kurse, lässt sich jedoch nicht an die fpt-spezifischen Prozesse anpassen. Teile der Inhalte beschreiben Workflows, die von den in dieser Arbeit eingeführten Konventionen abweichen, und könnten damit zu Missverständnissen führen.

GitHub Skills stellt hochwertige, interaktive Lernpfade bereit, ist jedoch stark auf einen workspace-basierten Ansatz ausgerichtet. Die Übertragbarkeit auf den TwinCat- und WorkVisual-Kontext der O-SW ist begrenzt, da diese Werkzeuge in den Inhalten keine Berücksichtigung finden.

YouTube bietet umfangreiche und didaktisch vielfältige Inhalte zu Git und GitHub. Für den grundlegenden Einstieg sind einzelne Videos geeignet, jedoch fehlen O-SW-spezifische Prozesse vollständig. YouTube eignet sich deshalb nur als ergänzendes Medium, nicht als primäres Schulungsinstrument.

Die eigene Dokumentation im fpt-internen Wiki erweist sich als die geeignetste Lösung. Inhalte können beliebig an die tatsächlich eingesetzten Prozesse angepasst, multimedial ergänzt und jederzeit aktualisiert werden. Die Unterlagen sind für alle Mitarbeitenden zugänglich und können als langfristiges Nachschlagewerk genutzt werden.

Die gewählte Strategie kombiniert Wiki-basierte Dokumentation mit ergänzenden Präsentationen für Einweisungsgespräche und ausgewählten YouTube-Videos für den allgemeinen Einstieg.


== Umsetzung der Dokumentation

=== Git und GitHub Grundlagen

Die Dokumentation der Git- und GitHub-Grundlagen bildet den Einstieg für neue Mitarbeitende und Auszubildende. Behandelt werden Versionsverwaltung, Branches und Pull Requests im Unternehmenskontext. Sie dient sowohl zum Onboarding als auch als dauerhaftes Nachschlagewerk.

Inhaltlich deckt der Baustein die Grundkonzepte von Git ab: die Unterscheidung zwischen Working Directory, Staging Area und Repository sowie die Bedeutung von Commits als atomare Änderungseinheiten. Der typische Team-Workflow mit den Schritten klonen, ändern, committen, pushen und Pull Request erstellen wird schrittweise erläutert. Ergänzend werden Branches, Merges und Konfliktlösung behandelt, da diese Konzepte erfahrungsgemäß die häufigsten Verständnisprobleme verursachen.

Das Format kombiniert eine schriftliche Referenz im fpt-Wiki, einen Link zu einer begleitenden Präsentation und ein einführendes Video-Tutorial. Dieses mehrstufige Lernangebot ermöglicht es, je nach Vorwissen unterschiedliche Einstiegspunkte zu wählen. Der Rollout erfolgt über Wiki-Publikation, anschließende Einweisungsgespräche, eine Feedbackrunde und abschließende Integration der fpt-spezifischen Vorgaben zu Branching und Reviews.

Nach Abschluss des Bausteins können die Teilnehmenden Git- und GitHub-Grundkonzepte erklären und voneinander abgrenzen, den Standard-Workflow sicher durchführen, Branches und Merges korrekt handhaben sowie typische Probleme erkennen und eigenständig lösen.


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

Der Schulungsbaustein zur Entwicklungsumgebung vermittelt den sicheren Umgang mit VS Code im täglichen GitHub-Workflow. Ausgangspunkt ist eine PowerPoint-Präsentation, die das Grundverständnis der Oberfläche aufbaut; die dazugehörige Wiki-Dokumentation dient als dauerhaftes Referenzdokument.

Inhaltlich umfasst der Baustein die Installation und Einrichtung von VS Code inklusive der empfohlenen Extensions sowie die Konfiguration eines Workspace. Der tägliche Workflow wird vollständig abgebildet: von fetch und pull über den Branch-Wechsel und die Bearbeitung bis hin zu Commit, Push und Pull-Request-Erstellung. Ein besonderes Augenmerk liegt auf der Integration der TwinCat XAE Shell, da hier das Zusammenspiel beider Werkzeuge für SPS-Programmierer nicht selbstverständlich ist. Der typische Ablauf wird als durchgängige Schrittfolge dargestellt: Änderung in der XAE Shell vornehmen, in VS Code committen und pushen. Abschließend wird der KI-Einsatz über den Copilot-Workflow thematisiert, inklusive der Erwartungshaltung an automatische Befunde und der Notwendigkeit kritischer Bewertung der Ergebnisse.

Didaktisch folgt der Baustein dem gleichen Muster wie die übrigen Schulungskapitel: kompakte Einführung, standardisierte Schrittfolgen, Best Practices und typische Fehler. Nach Abschluss können die Teilnehmenden das VS-Code-Setup selbstständig durchführen, den täglichen GitHub-Workflow sicher anwenden, die XAE Shell korrekt als Komplement einsetzen und KI-Hinweise kritisch als Entscheidungshilfe bewerten. Damit werden nicht nur Bedienkenntnisse vermittelt, sondern ein verbindliches Verhaltensmodell für den Teamalltag etabliert.

== Zwischenfazit zur Schulung und Wissenssicherung

*Erkenntnis:* Die Wirksamkeit der technischen Maßnahmen hängt wesentlich davon ab, ob Prozesswissen, Tool-Bedienung und Rollenverständnis gemeinsam vermittelt werden.

*Implikation:* Ein mehrstufiges Lernangebot aus Wiki, Präsentation und betreuter Praxis reduziert Einstiegshürden und stabilisiert die Anwendung der Standards im Tagesgeschäft.


= Einführung im Team


Die Einführung der neuen Vorgehensweise erfolgt stufenweise, um die operative Projektarbeit nicht zu unterbrechen. Zunächst werden die Kernprozesse Branching, Pull-Request-Freigabe und ZenHub-Board-Nutzung in einer kompakten Basisschulung vermittelt. Diese Schulung richtet sich an alle Beteiligten der O-SW und kombiniert Prozessübersicht mit kurzen, praxisnahen Übungen aus dem tatsächlichen Arbeitsumfeld.

Im zweiten Schritt wird die Anwendung in laufenden Projekten durch begleitete Praxisphasen abgesichert. Dabei werden in definierten Zeitfenstern reale Arbeitspakete nach dem neuen Standard durchgeführt und anschließend gemeinsam ausgewertet. Ziel ist es, Unsicherheiten früh sichtbar zu machen und die Richtlinien dort nachzuschärfen, wo sie im Alltag noch zu Interpretationsspielraum führen.

Zur nachhaltigen Verankerung wird ergänzend ein leicht zugängliches Wissenspaket im internen Wiki bereitgestellt. Dieses umfasst Prozessbeschreibungen, Namenskonventionen, Standardabläufe für typische Branching-Situationen sowie Leitlinien zur Bewertung von Copilot-Hinweisen. Damit steht sowohl für Neueinsteiger als auch für erfahrene Mitarbeitende eine einheitliche Referenz zur Verfügung.

Die Wirksamkeit der Einführung wird über regelmäßige Kurz-Reviews im Team überprüft. In diesen Terminen werden wiederkehrende Probleme gesammelt, Verbesserungsmaßnahmen beschlossen und dokumentiert. So entsteht ein kontinuierlicher Verbesserungsprozess, der technische Qualität und organisatorische Umsetzbarkeit gleichermaßen berücksichtigt.


= Diskussion, Limitationen und Wirtschaftlichkeit

== Einordnung der Ergebnisse

Die Ergebnisse zeigen, dass die Kombination aus Branching-Regeln, Copilot-Review und integriertem Team-Management als Gesamtsystem wirkt. Einzelmaßnahmen erzeugen bereits lokale Verbesserungen, erreichen jedoch erst im Zusammenspiel eine stabile Wirkung auf Nachvollziehbarkeit, Qualitätskontrolle und Planbarkeit. Insbesondere die Kopplung von PR-Prozess und organisatorischer Aufgabensteuerung reduziert Schnittstellenverluste zwischen Entwicklung und Koordination.

Die Evaluation belegt zugleich, dass technische Qualität nicht ausschließlich über Tooling entsteht. Der größte Effekt ergibt sich dort, wo präzise Regeln, klare Rollen und einheitliche Arbeitsabläufe zusammengeführt werden. Für die #gls("O-SW") bedeutet das, dass methodische Disziplin im Prozess genauso relevant ist wie die Auswahl der Werkzeuge.

== Limitationen und Validität

Die Aussagekraft der Ergebnisse unterliegt mehreren Limitationen:

- *Interne Validität:* Die Untersuchung erfolgt in einem konkreten Unternehmenskontext mit begrenzter Teamgröße; individuelle Arbeitsstile können Ergebnisse mitprägen.
- *Externe Validität:* Die Übertragbarkeit auf andere Domänen ist nicht vollständig gegeben, insbesondere bei abweichenden Toolketten oder Release-Modellen.
- *Konstruktvalidität:* Ein Teil der Bewertung basiert auf semiquantitativen Trendkategorien statt auf durchgängigen numerischen Zeitreihen.
- *Plattformeinfluss:* Beobachtete Effekte im Review-Prozess sind teilweise durch GitHub-Diff-Mechanismen bestimmt und nicht allein durch Copilot-Instruktionen steuerbar.

Zur Minderung dieser Effekte wurden Iterationen klar getrennt, Maßnahmen isoliert bewertet und Befunde mit realen Repository-Änderungen abgeglichen. Dennoch bleiben Restrisiken, die in zukünftigen Auswertungszyklen mit erweiterten Datensätzen weiter reduziert werden sollten.

== Wirtschaftliche Einordnung

Die Einführung verursacht zunächst Mehraufwand durch Konzeption, Schulung und disziplinierte Prozessanwendung. Dem gegenüber stehen wiederkehrende Nutzenpotenziale im Betrieb:

- frühere Erkennung formaler Qualitätsmängel,
- geringerer Abstimmungsaufwand bei Priorisierung und Freigabe,
- bessere Nachvollziehbarkeit für Übergaben, Onboarding und Fehlersuche.

Für die O-SW wird die Wirtschaftlichkeit hier als pragmatische Kosten-Nutzen-Prognose auf Basis der zusätzlichen Toolkosten und der erwarteten Zeiteinsparung modelliert.
Die Zeiteinsparung ist hier nur eine Schätzung und kann je nach Mitarbeiter stark variieren.

*Zusätzliche Lizenzkosten (monatlich):*

- Copilot Business: 7 Lizenzen für Experten `19,99€ * 7` = `139,93€`
- ZenHub: 7 Lizenzen für Experten und betroffene Nutzer  `4,99€ * 7` = `34,39€`
- Summe Zusatzkosten/Monat = `174,32€`

*Nutzenannahme für die O-SW (jährlich):*

- Anzahl Betroffener Mitarbeiter: 25
- Zeiteinsparung pro Mitarbeiter pro Monat: 10
- Interner Stundensatz: `//ToDo: x EUR/Stunde`

Damit ergibt sich als einfache Nutzenformel:

#figure(caption: "Nutzenformel",
  math.equation(block: true,
    $"Monatlicher Nutzen" = 25_"Mitarbeiter" * 10_"Stunden/Mitarbeiter/Monat" * x_"EUR/Stunde"$
  )
)

Die Wirtschaftlichkeit ist gegeben, wenn gilt:

#figure(caption: "Break-even-Bedingung", 
  math.equation(block: true,
    $"Jährlicher Nutzen" > "Zusatzkosten/Jahr"$
  )
)

Auf Grundlage der Pilotbeobachtung ist diese Annahme plausibel: Obwohl frühere PR-Phasen (`feature/* -> develop`) mehr Disziplin und Zeit erfordern, sinkt der Aufwand in integrationsnahen Freigaben (`develop -> main`) deutlich. Zusätzlich reduziert die frühere Erkennung formaler Mängel späte Nacharbeit in Wartungsphasen.

In der Gesamtabwägung ist der Ansatz wirtschaftlich plausibel, wenn die anfänglichen Einführungsaufwände durch kontinuierliche Nutzung verstetigt werden. Besonders relevant ist dabei die Skalierungswirkung: Mit wachsender Projektanzahl sinken die relativen Zusatzkosten pro Änderung, während standardisierte Abläufe mehrfach nutzbaren Nutzen erzeugen.

== Governance-Empfehlungen für den Dauerbetrieb

Für einen stabilen Langzeitbetrieb werden folgende Leitplanken empfohlen:

- verbindliche Merge-Kriterien je Zielbranch,
- regelmäßige Pflege und Versionierung der Conventions,
- klar definierte Rollen für Priorisierung, Review und Freigabe,
- periodische Prozess-Reviews anhand der in @Metriken beschriebenen Indikatoren.

Diese Governance-Elemente sichern die Dauerhaftigkeit der eingeführten Methodik und reduzieren das Risiko einer schleichenden Rückkehr zu uneinheitlichen Arbeitsweisen.


= Fazit

*Erkenntnis:* Im Rahmen dieser Arbeit wurden für die identifizierten Problemfelder Branching, Management und Code-Review konkrete Maßnahmen konzipiert und in den Projektkontext überführt. Die Einführung eines angepassten Git-Flow-Modells, der Einsatz von Copilot-gestützten Reviews sowie die Einbindung von ZenHub adressieren sowohl technische als auch organisatorische Schwachstellen der bisherigen Arbeitsweise.

Die Einordnung der erwarteten Prozesswirkung kann ergänzend auf etablierten Befunden zu Delivery- und Team-Performance gestützt werden @forsgren2018accelerate.

*Implikation:* Die durchgeführten Tests und Abstimmungen zeigen, dass die gewählten Ansätze grundsätzlich geeignet sind, Transparenz, Nachvollziehbarkeit und Qualität in der Zusammenarbeit zu erhöhen. Gleichzeitig wurde deutlich, dass die Wirksamkeit der Maßnahmen von klar formulierten Richtlinien, konsistenter Anwendung im Team und einer belastbaren Schulungs- und Dokumentationsbasis abhängt.

Im Ergebnis lässt sich festhalten, dass vor allem das Zusammenspiel der Maßnahmen den größten Nutzen erzeugt. Eine Branching-Strategie allein verbessert die technische Ordnung, entfaltet ihre volle Wirkung aber erst in Verbindung mit nachvollziehbaren Reviews und strukturierter Aufgabensteuerung. Umgekehrt bleibt Projektmanagement ohne klare Entwicklungs- und Freigaberegeln in kritischen Phasen zu wenig belastbar. Die in dieser Arbeit entwickelte Kombination schafft daher eine tragfähige Grundlage für einen konsistenten End-to-End-Prozess von der Aufgabenplanung bis zur Integration in stabile Zielbranches.

Gleichzeitig wurden Grenzen sichtbar. KI-gestützte Reviews erhöhen die Prüfbreite deutlich, ersetzen aber keine fachliche Bewertung durch erfahrene Entwickler, insbesondere bei domänenspezifischen SPS-Logiken und bei semantisch komplexen Änderungen. Darüber hinaus erzeugt die stärkere Standardisierung anfangs zusätzlichen Abstimmungsaufwand, bis Rollen, Namensregeln und Freigabekriterien im Team verlässlich eingeübt sind. Diese Einführungsphase ist kein Nachteil des Ansatzes, sondern eine notwendige Voraussetzung für die spätere Prozessstabilität.

Als nächster Schritt empfiehlt sich die fortlaufende Messung ausgewählter Prozessindikatoren, beispielsweise Durchlaufzeiten von Pull Requests, Anteil ungeplanter Nacharbeiten nach Merge sowie Häufigkeit von Konflikten in integrationsnahen Branches. Auf dieser Basis kann die eingeführte Methodik datenbasiert weiterentwickelt werden. Parallel sollte die Wissensbasis im Wiki kontinuierlich gepflegt werden, damit neue Teammitglieder den Standard schnell übernehmen und bestehende Mitarbeitende bei Abweichungen auf konsolidierte Referenzen zurückgreifen können.

*Ausblick/Übergang:* Insgesamt legt die Arbeit damit eine praktikable Grundlage für einen einheitlichen, GitHub-basierten Entwicklungs- und Steuerungsprozess in der #gls("fpt Systems GmbH").
