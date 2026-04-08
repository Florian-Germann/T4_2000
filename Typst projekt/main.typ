#import "@preview/clean-dhbw:0.4.0": *
#import "glossary.typ": glossary-entries

#show: clean-dhbw.with(
  title: "Konzeption und Implementierung einer GitHub-Branching-Strategie mit KI-gestützter Compliance",
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

= Einleitung

Effiziente und strukturierte Quellcodeverwaltung ist zentral für moderne Softwareentwicklung. In verteilten Teams, in denen parallel an verschiedenen Komponenten gearbeitet wird, gewinnt die Organisation von Versionsständen hohe Bedeutung. Git-basierte Plattformen wie GitHub bieten hierfür leistungsfähige Lösungen.

GitHub ist eine webbasierte Plattform zur zentralen Speicherung, Verwaltung und kollaborativen Weiterentwicklung von Softwareprojekten. Durch die Git-Versionskontrolle werden Änderungen nachvollziehbar dokumentiert und frühere Stände wiederherstellbar. Dies erhöht Transparenz und Nachverfolgbarkeit in komplexen Projekten.

Ein zentrales Konzept ist der Branch. Branches sind isolierte Entwicklungszweige, mit denen neue Funktionen, Fehlerbehebungen und Experimente von der Hauptlinie getrennt durchgeführt werden können. Änderungen werden erst nach Prüfung zurückgeführt. So sind parallele Arbeiten möglich ohne gegenseitige Störungen.

Durch diese Kombination aus Versionskontrolle, klarer Nachvollziehbarkeit und parallelen Entwicklungszweigen bietet GitHub eine strukturierte Grundlage für moderne Softwareentwicklung in Teams verschiedener Größe.

Die Effektivität von GitHub ist abhängig von der Wahl einer geeigneten Branching-Strategie. Branching-Regeln definieren, wie Features, Bugfixes und Releases organisiert und integriert werden. Sie sind technisch und prozessual relevant für Koordination und Qualitätssicherung.

Die Abteilung #gls("E-SW") hat solche Strategien bereits erfolgreich implementiert. Diese Richtlinien werden auch in der #gls("O-SW") angewendet, um die Entwicklung der internen Bibliotheken und Template-Projekte zu verbessern. Im Folgenden sollen die Vorgaben zusätzlich für die Arbeit an den Anlagen übernommen werden. Da dort jedoch unterschiedliche Abläufe vorhanden sind und sich die Anforderungen deutlich unterscheiden, müssen die bestehenden Richtlinien auf ihre Anwendbarkeit geprüft und gegebenenfalls angepasst werden.


= Problematik

In der Abteilung #gls("O-SW") fehlt bislang eine einheitliche und verbindliche Vorgehensweise für den Umgang mit Branches in GitHub. Obwohl die Richtlinien aus der #gls("E-SW") bereits für interne Bibliotheken und Template-Projekte übernommen wurden, zeigt sich, dass diese Vorgaben unter Umständen nicht ohne Weiteres auf die Arbeit an den Anlagen übertragbar sind. Die dortigen Entwicklungsabläufe unterscheiden sich strukturell und inhaltlich, wodurch Unklarheiten und Inkonsistenzen im praktischen Einsatz entstehen können.

Diese fehlende Passgenauigkeit führt dazu, dass Branching-Entscheidungen individuell und uneinheitlich getroffen werden. Dadurch entstehen Risiken wie unklare Versionsstände, erschwerte Nachvollziehbarkeit von Änderungen und ein erhöhtes Konfliktpotenzial beim Zusammenführen von Code. Gleichzeitig erschwert die heterogene Anwendung bestehender Richtlinien eine effiziente Zusammenarbeit innerhalb des Teams und beeinträchtigt die Qualitätssicherung im Entwicklungsprozess.

Die zentrale Herausforderung besteht somit darin, die vorhandenen Strategien systematisch auf ihre Eignung für die spezifischen Abläufe der #gls("O-SW") zu prüfen und daraus konsistente, abteilungsweit gültige Richtlinien abzuleiten.

Des Weiteren soll in diesem Prozess ebenfalls die Prüfung der geltenden Coding-Conventions implementiert und gegebenenfalls durch KI gestützt werden.

Außerdem müssen nach der Umsetzung alle Mitarbeiter darüber in Kenntnis gesetzt und entsprechend geschult werden, um die korrekte Umsetzung und effiziente Nutzung zu gewährleisten.


= Aktueller Stand der Richtlinien

== Industriestandards

Auch in der Industrie sind verschiedene Standards vorhanden, die seit vielen Jahren genutzt werden. 
Im Folgenden sollen die zwei bekanntesten erläutert und auf Anwendbarkeit für die aktuelle Situation analysiert werden.

=== GitHub-Flow

#figure(image("assets/GitHub-Flow.png", width: 80%), caption: "GitHub Flow" )<GitHub-Flow>

GitHub-Flow ist ein leichtgewichtiges, kontinuierlich ausgerichtetes Branching-Modell, das speziell für Teams entwickelt wurde, die schnell und flexibel deployen möchten. Es setzt auf kurze Feature-Branches, häufige Pull Requests und automatisierte Tests, um Änderungen zügig in den Main-Branch zu integrieren. Besonders beliebt ist GitHub-Flow in modernen DevOps-Umgebungen und Projekten, in denen kontinuierliche Auslieferung und hohe Release-Geschwindigkeit im Vordergrund stehen, wie z.B. bei Web-Apps.

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

In @Tabelle-GitHub-Flow sind die einzelnen Branches beschrieben und wie sie funktionieren, was auch nochmal in @GitHub-Flow erkennbar ist. Hiermit wird klar, dass diese Strategie sich sehr gut für schnelle Feature Releases eignet. Allerdings gilt dies nur unter bestimmten Bedingungen. Die Eignung hängt von den spezifischen Anforderungen der Organisation ab. 
==== Vorteile
- Schnelle Iteration
- geringe Komplexität
- ideal für Kontinuierliche Integration
==== Nachteile
- Wenig Struktur für große Releases
- Risiko von instabilem Main-Branch bei häufigem mergen
==== Fazit

Zusammenfassend bietet GitHub-Flow eine einfache und agile Branching-Strategie, die sich ideal für Teams eignet, die kontinuierliche Integration und schnelle Feature-Releases priorisieren. Durch kurze Feature-Branches und direkte Merges in den Main-Branch fördert es Flexibilität und reduziert Overhead. Im Kontext der #gls("O-SW")-Abteilung, die auf strukturierte Meilenstein-Releases setzt, zeigt sich jedoch eine Schwäche: Die fehlende Isolation von Release-Vorbereitungen kann zu Instabilitäten führen und die Qualitätssicherung erschweren. Daher ist GitHub-Flow weniger geeignet als komplexere Modelle wie Git-Flow, die eine klarere Trennung von Entwicklungs- und Release-Phasen bieten.

GitHub-Flow zeigt also Grenzen für die O-SW. Im Folgenden wird die Alternative Git-Flow analysiert, um festzustellen, ob diese 
besser zum Kontext passt.

=== Git-Flow <Git-Flow>


#figure(image("assets/Gitflow-Workflow-4.png", width: 80%), caption: "Git Flow" )<Git-Flow-Grafik>

Git-Flow ist ein strukturiertes Branching-Modell für Git, das Teams hilft, Entwicklungsprozesse klar zu organisieren und gleichzeitig stabile Releases sicherzustellen. Es wurde 2010 von Vincent Driessen entwickelt und ist besonders in Projekten beliebt, in denen mehrere Features, Hotfixes und Versionen parallel entstehen.

Dies umfasst einige langlebige Branches, denen gewisse Regeln auferlegt sind.
In @Git-Flow-Grafik wird erkennbar, wie diese sich verändern können und in welchen Branches tatsächlich commitet wird. Des Weiteren sind in @tabelle-Git-Flow die einzelnen Branches bzw. Branch-Gruppen beschrieben.

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

    wird von develop abgespalten

    Änderungen fließen wieder in develop

    z.B. erstellung Release Notes
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

Zu Beginn wurde von Ralf Scheyerle, welcher für die Richtlinien bei #gls("E-SW") verantwortlich ist, ein aktueller Stand dieser angefordert. Da das Team aus lediglich fünf Personen besteht, waren diese hauptsächlich mündlich dokumentiert und nur in einem einfachen Word-Dokument festgehalten. 

In @Git-Flow-E-SW, das in diesem Word-Dokument dokumentiert ist, zeigt sich, dass die aktuelle Strategie der #gls("E-SW") den Git-Flow-Prinzipien stark entspricht. Der wesentliche Unterschied, wie in @tabelle-E-SW näher beschrieben, liegt darin, dass Releases nicht in separaten release/\*-Branches vorbereitet, sondern in main durchgeführt und dann über einen release/\*-Branch veröffentlicht werden. Dies hat den Vorteil, dass schnell auf den Code-Stand eines früheren Releases zugegriffen werden kann, ohne in Tags oder Pull Requests nach der Versionsnummer suchen zu müssen. Nachteilig ist jedoch, dass sich langfristig eine großes Volumen an inaktiven Branches akkumuliert, wodurch die Übersichtlichkeit beeinträchtigt wird.

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

Auf Basis von Gesprächen mit Robin Hettel, dem in #gls("O-SW") für Richtlinien verantwortlichen Mitarbeiter, wurde festgestellt, dass die Implementierung von Git-Flow sowohl zweckmäßig als auch gewünscht ist. Dies begründet sich darin, dass Git-Flow für die wenigen großen Releases in Projekten besser anwendbar ist als GitHub-Flow. Darüber hinaus würde der in @E-SW-Richtlinien genannte Vorteil hier nicht relevant sein, da Releases ausschließlich an Projektmeilensteinen erfolgen, weshalb der aktuelle Code-Stand ohnehin die primäre Anforderung darstellt.


= Prüfung der Coding-Conventions


Der GitHub Copilot kann weit mehr als nur Code vervollständigen: Er unterstützt Entwickler auch dabei, bestehende Coding Conventions automatisch einzuhalten. Während des Schreibens analysiert Copilot den Kontext, erkennt typische Muster und orientiert sich an projektinternen Standards. Dadurch entstehen Vorschläge, die nicht nur funktional sind, sondern auch stilistisch konsistent bleiben. Teams profitieren so von einer gleichmäßig hohen Codequalität, weniger manuellen Korrekturen und einem deutlich effizienteren Review-Prozess.

== Aktueller Stand bei fpt

Der aktuelle Stand bei fpt ist, dass der Copilot derzeit lediglich getestet wird. Hierzu wurde von den Verantwortlichen ein Test-Repository erstellt, um nicht in kritischen Bereichen zu agieren. Da der Copilot für Code Reviews nur auf das jeweilige Repository zugreifen kann, müssen im .github-Ordner die Coding-Conventions hinterlegt sein. Das geschieht über .md-Dateien, da GitHub diese nativ in gerenderter Form anzeigen kann. Um sicherzustellen, dass alle Repositories aktualisiert bleiben und Änderungen nicht manuell in der gesamten Organisation verteilt werden müssen, wurde das in @CodingConventionDiagramm dargestellte System implementiert. Jeder Block repräsentiert ein Repository, die Pfeile symbolisieren GitHub Actions.

Bei einer Änderung der Coding-Conventions wird im Übersichts-Repository eine GitHub-Aktion ausgeführt, welche die aktuellen .md-Dateien an die Bibliotheken und Template-Projekte verteilt. Da in den Aktionen die genauen Repositories angegeben werden müssen, können auf diese Weise nicht direkt die Dateien in den Projekt-Repositories angepasst werden, da diese kontinuierlich neu erstellt werden. Stattdessen werden im Template-Projekt Aktionen eingerichtet, die in allen abgeleiteten Projekten vorhanden sind und die aktuellen Conventions aus dem Übersichts-Repository abrufen. Auf diese Weise sind in allen relevanten Repositories die aktuellen Conventions verfügbar.


#figure(image("assets\CodingConventionFlow.png", width: 90%), caption: "Coding-Convention Verteilung" )<CodingConventionDiagramm>

Diese Aktionen sind bereits in allen #gls("O-SW")-Repositories vorhanden, die keine Projekt-Repositories sind. Diese wurden intensiv auf Fehler getestet. Auch die Funktion, dass neue Projekte diese Aktionen automatisch erhalten, ist bereits implementiert.


Des Weiteren ist auf dem Test-Repository schon implementiert worden, dass der Copilot bei jeder Pull Request auf main automatisch alle Commits auf die Coding-Conventions überprüft und dann entsprechende Vorschläge liefert, um potenzielle Fehler zu beheben. Um diese Funktion auf Richtigkeit zu überprüfen, wurden mit Absicht eigene Fehler eingebaut. Aus den resultierenden Antworten des Copilot auf die Pull Requests konnten nun einige Probleme abgeleitet werden. 
Diese sollen im Folgenden aufgelistet, erläutert und potenziell gelöst werden.


== Testablauf

Zur Evaluierung der Zuverlässigkeit des GitHub-Copilot wurde ein separater Branch im Test-Repository angelegt, in den gezielt Fehler eingebaut wurden. Diese reflektieren häufig auftretende Programmierfehler, um typische Probleme zu identifizieren. Anschließend wird ein Pull-Request in main erstellt, um die konfigurierte Code-Review-Richtlinie zu aktivieren. Der Copilot analysiert daraufhin die Änderungen und verfasst entsprechende Kommentare zum Pull-Request.

Da der Copilot die Pull-Request-Beschreibung und weitere Kommentare verarbeitet, wurde die Checkliste mit den intentionalen Fehlern erst nach dem Review erstellt, um den Entwicklungsverlauf zu dokumentieren. 

Wenn eine Änderung an den Coding-Conventions oder Copilot-Anweisungen durchgeführt wurde, wurde der alte Pull-Request gelöscht und ein neuer erstellt, um eine kontrollierte Testumgebung zu gewährleisten. 


== Probleme und potenzielle Lösungen

==== Grundproblem

Bei den Code-Reviews durch den Copilot trat überwiegend das Problem auf, dass die Gründlichkeit nicht ausreichend war. Nach Recherchen und Konsultation des GitHub-Copilot-Chat stellte sich heraus, dass die Coding-Conventions wahrscheinlich nicht präzise genug formuliert waren. Aus diesem Grund wurden die vollständigen Kapitel "#gls("TwinCat")" und "Allgemein" überarbeitet. Hierzu wurde der Microsoft-Copilot-Agent "Prompt Coach" eingesetzt. Diesem wurde die Aufgabe erteilt, die Coding-Conventions unter Berücksichtigung des Kontexts für verbesserte KI-Kompatibilität zu überarbeiten. Dies umfasste hauptsächlich eine Neuformulierung und die Ergänzung separater Copilot-Anweisungen.

Nach dieser Anpassung verbesserte sich die Qualität der Reviews erheblich. Dies zeigte sich darin, dass die Referenzierung von Kapiteln konsistent funktionierte und jedes identifizierte Problem mindestens als unterdrückter Kommentar erschien.

==== Problem 1

Das persistente Grundproblem, das sich manifestierte, bestand darin, dass der Copilot Schwierigkeiten bei der Erkennung von Benennungsregelsverletzungen für Variablentypen innerhalb von Structs aufwies. Ebenso war die Erkennung des Präfix stc\_ für Struct-Typ-Variablen beeinträchtigt. Dies äußerte sich dadurch, dass Verstöße zwar erkannt, aber der zugehörige Kommentar unterdrückt wurde. Das Problem wurde durch gezieltes Entfernen des Präfix für einen Variablentypen in einer Struct im Testcode reproduziert. Zur Lösung wurden die relevanten Auszüge aus den Coding-Conventions @VariableNaming in den Kontextdialog integriert.

#figure(image("assets\Vorgaben-Variablen.png", width: 70%), caption: "Coding-Convention Variablen Präfixe" )<VariableNaming>


= Fazit
