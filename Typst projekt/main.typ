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

Die Effektivität von GitHub hängt allerdings von der Wahl einer passenden Branching-Strategie ab. Branching-Regeln definieren, wie Features, Bugfixes und Releases organisiert und integriert werden. Sie sind technisch und prozessual relevant für Koordination und Qualitätssicherung.

Genau solche Strategien besitzt die Abteilung #gls("E-SW") bereits, wo sie erfolgreich eingesetzt werden. Diese Richtlinien werden auch in der #gls("O-SW") genutzt, um die Entwicklung der internen Bibliotheken und Template-Projekte zu verbessern. Nun sollen die Vorgaben zusätzlich für die Arbeit an den Anlagen angewendet werden. Da dort jedoch ein anderer Ablauf herrscht und sich die Anforderungen deutlich unterscheiden, müssen die bestehenden Richtlinien auf ihre Kompatibilität geprüft und gegebenenfalls angepasst werden.


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

Dieses System eignet sich hervorragend für einen Strukturierten Ablauf mit klaren, großen und aufeinander folgende Releases, ist allerdings eher ungeeignet, für die Entwicklung von "Rolling Releases", da der Weg zum Release zu langsam ist. Weil aber die Projekte in der #gls("O-SW") nur bei den Projektmeilensteinen einen Release vorsehen, eignet sich dieses System am besten.

== Richtlinien E-SW<E-SW-Richtlinien>


#figure(image("assets/Git-Flow-E-SW.png", width: 90%), caption: "Git Flow E-SW" )<Git-Flow-E-SW>

Zu Beginn wurde von Ralf Scheyerle, welcher für die Richtlinien bei #gls("E-SW") zuständig ist, ein aktueller Stand dieser angefordert. Da das Team allerdings nur 5 Personen umfasst, wurden diese hauptsächlich mündlich kommuniziert und lediglich in einem einfachen Word-Dokument grob formuliert. 

In @Git-Flow-E-SW, welches in diesem Word Dokument liegt, ist bereits erkennbar, dass die aktuelle Strategie der #gls("E-SW") bereits sehr stark der Git-Flow Strategie ähnelt. Der einzige Unterschied, wie in @tabelle-E-SW, welche auch in dem Dokument ist, genauer beschrieben wurde, werden hier die Releases nicht in den release/\* Branches vorbereitet, sondern in main, und dann in einem release Branch Veröffentlicht. Dies hat den Vorteil, dass man schnell zum Code-Stand eines vergangenen Releases zurückspringen kann, ohne in den Tags/Pull Requests nach der Versionsnummer suchen zu müssen.
Es hat aber den Nachteil, dass sich auf Dauer eine sehr große Menge an "toten" Branches akkumulieren, welche das Arbeiten unübersichtlich machen.

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

Nach Gesprächen mit dem in #gls("O-SW") für die Richtlinien verantwortlichen Mitarbeiter Robin Hettel stellte sich heraus, dass zum aktuellen Zeitpunkt die Implementierung von Git-Flow sowohl am sinnvollsten, als auch gewünscht ist. Dies ist darauf zurückzuführen, dass diese für die wenigen großen Releases in Projekten besser anwendbar ist als GitHub-Flow. Außerdem würde der Vorteil, der in @E-SW-Richtlinien genannt wurde, hier keine Anwendung finden, da nur die Projektmeilensteine einem Release nahe kommen, und da benötigt man ohnehin lediglich den letzten Stand.


= Prüfung der Coding-Conventions


Der GitHub Copilot kann weit mehr als nur Code vervollständigen: Er unterstützt Entwickler auch dabei, bestehende Coding Conventions automatisch einzuhalten. Während des Schreibens analysiert Copilot den Kontext, erkennt typische Muster und orientiert sich an projektinternen Standards. Dadurch entstehen Vorschläge, die nicht nur funktional sind, sondern auch stilistisch konsistent bleiben. Teams profitieren so von einer gleichmäßig hohen Codequalität, weniger manuellen Korrekturen und einem deutlich effizienteren Review-Prozess.

== Aktueller Stand bei fpt

Der aktuelle Stand bei fpt ist, dass der Copilot derzeit lediglich getestet wird. Hierzu wurde von den Verantwortlichen ein Test-Repository erstellt, um nicht in kritischen Bereichen zu agieren. Da der Copilot für Code Reviews nur auf das jeweilige Repository zugreifen kann, müssen im .github-Ordner die Coding-Conventions hinterlegt sein. Das geschieht über .md-Dateien, da GitHub diese nativ in gerenderter Form anzeigen kann. Damit alle Repositories stets auf dem neuesten Stand bleiben und Änderungen nicht manuell in der gesamten Organisation verteilt werden müssen, wurde das in @CodingConventionDiagramm dargestellte System erstellt. Jeder Block steht für ein Repository und die Pfeile repräsentieren GitHub Actions.

Wenn nun eine Änderung in den Coding-Conventions auftritt, wird im Übersichts-Repository eine GitHub-Aktion ausgeführt, welche die aktuellen .md Dateien auf die Libraries und die Template Projekte verteilt. Da in den Aktionen aber immer die genauen Repositories angegeben werden müssen, kann man über diese Möglichkeit nicht direkt die Dateien in den Projekt-Repos anpassen, da hier ständig neue erstellt werden. Man kann aber im Template Projekt Aktionen anlegen, welche dann auch in jedem Projekt vorhanden sind, welche die aktuellen Conventions im Übersichts-Repo anfragen, das diese dann zurückgibt. Somit sind in allen relevanten Repositories die aktuellen Conventions verteilt.


#figure(image("assets\CodingConventionFlow.png", width: 90%), caption: "Coding-Convention Verteilung" )<CodingConventionDiagramm>

Diese Aktionen sind bereits in allen #gls("O-SW")-Repositories vorhanden, die keine Projekt-Repositories sind. Diese wurden intensiv auf Fehler getestet. Auch die Funktion, dass neue Projekte diese Aktionen automatisch erhalten, ist bereits implementiert.


Des Weiteren ist auf dem Test-Repository schon implementiert worden, dass der Copilot bei jeder Pull Request auf main automatisch alle Commits auf die Coding-Conventions überprüft und dann entsprechende Vorschläge liefert, um potenzielle Fehler zu beheben. Um diese Funktion auf Richtigkeit zu überprüfen, wurden mit Absicht eigene Fehler eingebaut. Aus den resultierenden Antworten des Copilot auf die Pull Requests konnten nun einige Probleme abgeleitet werden. 
Diese sollen im Folgenden aufgelistet, erläutert und potenziell gelöst werden.

== Probleme und potenzielle Lösungen

==== Problem 1

Das erste Problem, welches auftauchte war, dass der GitHub-Copilot bei #gls("TwinCat3") Projekten den Namen für Propertys von Funktionsbausteinen nicht geprüft hat. Dies führte dazu, dass diese auch nicht auf den Korrekten Präfix "P\_" geprüft werden konnten. Da im Internet keine Information zu diesem Verhalten zu finden waren, wurde versucht, dieses Problem dem Copilot selbst zu schildern um herauszufinden, woran als liegen könnte. Dazu wurde @prompt1 mit Referenzierung zum betreffenden Repository, verwendet. Diesem wurde auch ein Ausschnitt aus dem Relevanten Teil der Coding-Conventions übergeben, welcher in @PropertyNaming zu sehen ist.

#figure(image("assets\Vorgabe-Property.png", width: 90%), caption: "Coding-Convention Property Benennung" )<PropertyNaming>

#figure(raw( "Ich habe ein Problem bei der Nutzung von codeüberprüfung in Github mit dem GitHub Copilot. Dieser soll in meinem Repository automatisch bei Pull requests in main auf die aktuell geltenden Coding-Conventions überprüfen. Dabei erkennt er auch fast alle Fehler richtig. Nur bei der benennung von Propertys eines TwinCat3 Funktionsbausteins scheint er Probleme zu haben. Diese sollten nämlich auf das Präfix \"P_\" geprüft werden. wenn eine Property aber mit dem Präfix \"M_\" deklariert wird, meldet der copilot den Fehler nicht. Woran könnte das liegen?"), caption: "Prompt")<prompt1>


Auf diesen Prompt anwortete der Copilot, dass das Problem mit der Erkennung warscheinlich auf der Tatsache basiert, dass die Regel in einer Tabelle formuliert ist. Dies sei für Sprachbasierte KI-Systeme schwer zu verstehen und eine Formulierung um Klartext würde dieses Problem warscheinlich lösen. Hierzu schlug er die Sätze, _"Propertys müssen ausnahmslos mit dem Präfix "P\_" beginnen. Transitionen müssen ausnahmslos mit dem Präfix "T\_" beginnen. Andere Präfixe sind für diese Typen nicht zulässig."_ vor. Diesen wurde noch die Klarifikation für Transitionen beigefügt, da diese ebenfalls teilweise schwer zu erkennen seien. 

==== Problem 2

Das zweite Problem, das sich zeigte, war, dass der Copilot Schwierigkeiten hatte, Verstöße gegen die Benennungsregeln für Variablentypen, innerhalb von Structs zu erkennen. 
Dies zeigte sich in der Form, dass die Verstöße zwar erkannt wurden, aber der Kommentar unterdrückt wurde, da sich die KI nicht sicher war. 
Das Problem wurde hervorgerufen, indem bei einem Struct im Testcode das Präfix für den Variablentypen entfernt wurde. Hierzu wurde der Prompt aus @prompt2 verwendet. Dieses wurde im gleichen Chat versendet wie @prompt1, um den bereits erkannten Kontext zu nutzen. Außerdem wurde wieder der Relevante Ausschnitt aus den Coding-Conventions @VariableNaming beigefügt.

#figure(image("assets\Vorgaben-Variablen.png", width: 70%), caption: "Coding-Convention Variablen Präfixe" )<VariableNaming>

#figure(raw("Ich habe noch ein anderes Problem. Und zwar wird bei einem Benennungsverstoß innerhalb einer Structdeklaration dieser zwar erkannt, aber wegen Unsicherheit unterdrückt. woran könnte das liegen. Stelle fragen, um Unklarheiten aufzuklären"), caption:"Prompt 2")<prompt2>

Nach einer kleinen Klarifikation hat der Copilot das Problem ebenfalls auf die Tabelle zurückgeführt. Allerdings mit dem Unterschied, dass hier das Ergebnis nur "uncertain" und nicht komplettes ignorieren ist. Daraufhin hat er einen Zusatz für die Coding-Conventions vorgeschlagen, die Explizit erwähnen, dass diese allgemeine Anforderung auch für Variablen innerhalb von Structs oder Enums gelten. Zudem hat er zu bool und integer jeweils ein Beispiel angefügt. 

= Fazit
