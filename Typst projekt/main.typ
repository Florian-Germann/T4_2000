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

GitHub ist eine webbasierte Plattform zur zentralen Speicherung, Verwaltung und kollaborativen Weiterentwicklung von Softwareprojekten. Durch die Git-Versionskontrolle werden Änderungen nachvollziehbar dokumentiert und frühere Stände wiederherstellbar. Dies erhöht Transparenz und Rückverfolgbarkeit in komplexen Projekten.

Ein zentrales Konzept ist der Branch. Branches sind isolierte Entwicklungszweige, mit denen neue Funktionen, Fehlerbehebungen und Experimente von der Hauptlinie getrennt durchgeführt werden können. Änderungen werden erst nach Prüfung zurückgeführt. So sind parallele Arbeiten möglich ohne gegenseitige Störungen.

Durch diese Kombination aus Versionskontrolle, klarer Nachvollziehbarkeit und parallelen Entwicklungszweigen bietet GitHub eine strukturierte Grundlage für moderne Softwareentwicklung. Sowohl für kleine Teams als auch für große.

Die Effektivität von GitHub hängt allerdings von der Wahl einer passenden Branching-Strategie ab. Branching-Regeln definieren, wie Features, Bugfixes und Releases organisiert sowie integriert werden. Sie sind technisch und prozessual relevant für Koordination und Qualitätssicherung.

Genau solche Strategien besitzt die Abteilung #gls("E-SW") bereits, wo sie erfolgreich eingesetzt werden. Diese Richtlinien werden auch in der #gls("O-SW") genutzt, um die Entwicklung der internen Bibliotheken und Template-Projekte zu verbessern. Nun sollen die Vorgaben zusätzlich für die Arbeit an den Anlagen angewendet werden. Da dort jedoch ein anderer Ablauf herrscht und sich die Anforderungen deutlich unterscheiden, müssen die bestehenden Richtlinien auf ihre Kompatibilität geprüft und gegebenenfalls angepasst werden.


= Problematik

In der Abteilung #gls("O-SW") fehlt bislang eine einheitliche und verbindliche Vorgehensweise für den Umgang mit Branches in GitHub. Obwohl die Richtlinien aus der #gls("E-SW") bereits für interne Bibliotheken und Template-Projekte übernommen wurden, zeigt sich, dass diese Vorgaben unter Umständen nicht ohne Weiteres auf die Arbeit an den Anlagen übertragbar sind. Die dortigen Entwicklungsabläufe unterscheiden sich strukturell und inhaltlich, wodurch Unklarheiten und Inkonsistenzen im praktischen Einsatz entstehen können.

Diese fehlende Passgenauigkeit führt dazu, dass Branching-Entscheidungen individuell und uneinheitlich getroffen werden. Dadurch entstehen Risiken wie unklare Versionsstände, erschwerte Nachvollziehbarkeit von Änderungen und ein erhöhtes Konfliktpotenzial beim Zusammenführen von Code. Gleichzeitig erschwert die heterogene Anwendung bestehender Richtlinien eine effiziente Zusammenarbeit innerhalb des Teams und beeinträchtigt die Qualitätssicherung im Entwicklungsprozess.

Die zentrale Herausforderung besteht somit darin, die vorhandenen Strategien systematisch auf ihre Eignung für die spezifischen Abläufe der #gls("O-SW") zu prüfen und daraus konsistente, abteilungsweit gültige Richtlinien abzuleiten.

Desweiteren soll in diesem Prozess ebenfalls die Prüfung der geltenden Coding-Conventions implementiert und gegebenenfalls durch KI gestützt werden.

Außerdem müssen nach die Änderungen alle Mitarbeiter darüber in Kenntniss gesetzt und entsprechend geschult werden, um die korrekte Umsetzung und effiziente Nutzung zu gewährleisten.


= Aktueller Stand

== Industriestandarts

Auch in der Industrie sind verschieden Standarts vorhanden, welche seit vielen Jahren genutzt werden. 
Im folgenden sollen die 3 bekanntesten Erklärt und auf Anwendbarkeit für die aktuelle Situation analysiert werden.

=== Git-Flow


#figure(image("assets/Gitflow-Workflow-4.png", width: 80%), caption: "Git Flow" )<Git-Flow>

Git-Flow ist ein strukturiertes Branching-Modell für Git, das Teams hilft, Entwicklungsprozesse klar zu organisieren und gleichzeitig stabile Releases sicherzustellen. Es wurde 2010 von Vincent Driessen entwickelt und ist besonders in Projekten beliebt, in denen mehrere Features, Hotfixes und Versionen parallel entstehen.

Dieses umfasst ein paar langlebige Branches, welchen gewisse Regeln auferlegt sind.
In @Git-Flow wird erkenntlich wie diese sich verändern können, bzw. in welchen Branches tatsächlich commitet wird. Desweiteren sind in @tabelle-Git-Flow die einzelnen Branches bzw. Branch-Gruppen beschrieben.

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

  // main/master
  [
    main/master
  ],
  [
    Enthält fertige Releases

    Stabil - Änderungen nur aus release/\* per PR

    Änderungen in main/master müssen zurück in develop fließen.
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
    Hotfix von main/master

    Änderungen fließen auch in develop
  ],
))<tabelle-Git-Flow>

=== GitHub-Flow

=== Trunk based 

== Richtlinien E-SW

Zu Beginn wurde von Ralf Scheyerle, welcher für die Richtlinien bei #gls("E-SW") zuständig ist, ein aktueller Stand dieser angefordert. Da das Team allerdings nur 5 Personen umfasst, wurden diese Hauptsächlich mündlich kommuniziert und lediglich in einem einfachen Word Dokument grob formuliert. 

#figure(image("assets/Git-Flow-E-SW.png", width: 90%), caption: "Git Flow E-SW" )<Git-Flow-E-SW>

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

Dieses Word Dokument enthällt zum einen @Git-Flow-E-SW und zum anderen @tabelle-E-SW. Diese deuten auf eine veränderte Git Flow Branching-Strategie hin, mit dem Unterschied, dass hier nicht in einem separaten release\/\* branch der Release vorbereitet wird, sondern in main und der Release erfolgt durch einen release\/\* branch.


== Prüfung Coding-Conventions




= Fazit
