// Get Polylux from the official package repository
#import "@preview/polylux:0.4.0": *

// Make the paper dimensions fit for a presentation and the text larger
#set page(paper: "presentation-16-9")
#set text(size: 25pt, font: "Source Sans 3")
#set par(leading: 0.45em)
#set list(spacing: 0.25em)

// Titelseite passend zur T4_2000-Ausarbeitung
#slide[
  #set align(center + horizon)
  #v(1.2fr)

  #text(size: 18pt, fill: rgb("#4B5563"))[Präsentation zur Studienarbeit T4_2000]
  #v(0.6em)
  #text(size: 42pt, weight: "bold")[
    Konzeption und Implementierung eines GitHub-basierten Branching-, Review- und Projektmanagementprozesses mit KI-gestützter Code-Compliance
  ]
  #v(1em)
  #text(size: 22pt)[Florian Germann]
  #text(size: 16pt, fill: rgb("#6B7280"))[DHBW Ravensburg Campus Friedrichshafen - TEA24]
  #v(0.6em)
  #text(size: 15pt, fill: rgb("#6B7280"))[fpt Systems GmbH]

  #v(1fr)
  #text(size: 14pt, fill: rgb("#9CA3AF"))[Stand: #datetime.today().display("[day].[month].[year]")]
  #v(0.3fr)
]

#slide[
  == Agenda und Zeitplan

  - Ausgangslage und Zielbild 
  - Forschungsfragen und Vorgehen 
  - Branching-Strategie: GitHub-Flow vs. Git-Flow 
  - Evaluation Copilot-Review 
  - Pilotierung im Projekt GIRA 
  - Projektmanagement mit ZenHub 
  - Wirtschaftlichkeit, Fazit, Ausblick 

]

#slide[
  == Ausgangslage und Zielbild

  *Problemfelder in der O-SW:*
  - Uneinheitliches Branching und dadurch höhere Merge-Risiken
  - Fehlende transparente Team- und Release-Planung
  - Begrenzte formale Codequalitätskontrolle in TwinCat
  - Medienbrüche in der Entwicklungsumgebung

  *Zielbild:*
  - Durchgängiger Prozess von Planung bis Merge
  - Klare Rollen, Regeln und Qualitäts-Gates
]

#slide[
  == Forschungsfragen

  - Verbessert ein angepasstes Git-Flow-Modell Stabilität und Nachvollziehbarkeit?
  - Welchen Beitrag leisten Copilot-gestützte Reviews gegen Regelverstöße?
  - Reduziert ZenHub den Abstimmungsaufwand und erhöht Transparenz?
  - Unter welchen Randbedingungen ist das Modell langfristig tragfähig?

  #v(0.6em)
  #text(size: 16pt, fill: rgb("#6B7280"))[Fokus der Arbeit: technische und organisatorische Wirksamkeit im Teamalltag]
]

#slide[
  == Methodisches Vorgehen

  - Iteratives Design: Analyse -> Konzeption -> Test -> Pilotierung -> Verstetigung
  - Isolierte Evaluation im Test-Repository mit reproduzierbaren PR-Zyklen
  - Datengrundlage:
    - 60 geschlossene Test-PRs (aktive Iterationen)
    - Teilstichprobe n = 40 im Projektabschnitt virtuelle Inbetriebnahme
  - Bewertung über Metriken:
    - Befundpräzision
    - Unterdrückungsanfälligkeit
    - Prozessdurchlauf und Koordinationsaufwand
]

#slide[
  == Branching-Entscheidung

  *Vergleich:*
  - GitHub-Flow: schlank, gut für häufige Continuous-Releases
  - Git-Flow: strukturierter, geeignet für parallele stabile Versionsstände

  *Bewertung für O-SW:*
  - Meilenstein-orientierte Freigaben statt Continuous Delivery
  - Hohe Anforderungen an Rückverfolgbarkeit und stabile Integrationspfade
  - Entscheidung: angepasstes Git-Flow-Modell als Standard
]

#slide[
  == Evaluation Copilot-Review: Iteration 1 und 2

  *Iteration 1 (Präzision):*
  - Ausgangslage: Regeln zu vage, uneinheitliche Befunde
  - Maßnahme: Conventions präzisiert und eindeutig referenzierbar gemacht
  - Ergebnis: deutlich höhere Befundqualität

  *Iteration 2 (Suppression):*
  - Problem: Kommentare bei Umbenennungen teils unterdrückt
  - Ursache: GitHub-Diff-Logik, nicht reine Copilot-Schwache
  - Maßnahme: Anti-Suppression-Strategie mit zusätzlichen Fundstellen
]

#slide[
  == Evaluation Copilot-Review: Iteration 3 und 4

  *Iteration 3 (Balance):*
  - Zu restriktive Instruktionen behindern Assistenzmodus
  - Anpassung der Regeln: Review-Präzision bleibt, Assistenz wird flexibler

  *Iteration 4 (Bestandscode):*
  - PR-Reviews sehen nur Diff, nicht historischen Code
  - Ergänzung durch Repo-weite Bestandscode-Analyse

  *Kernaussage:*
  - KI-Review wirkt, wenn Conventions präzise und Prozesse klar sind
]

#slide[
  == Pilotierung im Projekt GIRA

  - Umsetzung während virtueller Inbetriebnahme
  - Branching-Regeln wurden stabil angewendet
  - PRs wirkten als früher Qualitäts-Kontrollpunkt
  - Anfangs mehraufwand durch Disziplin bei Branches und PR-Vorbereitung

  *Wichtige Teamregeln aus der Praxis:*
  - Auskommentierter Code in `develop` nur mit klarer ToDo-Markierung
  - `.tmc` in `.gitignore`, um maschinenspezifische Konflikte zu vermeiden
]

#slide[
  == Pilot-Ergebnisse: Copilot-Befunde (n = 40)

  - Korrekt erkannte Befunde: 25 (62,5 %)
  - Manuelle Prüfung erforderlich: 13 (32,5 %)
  - Falsch-Positive: 2 (5,0 %)

  *Interpretation:*
  - Starker Mehrwert bei formalen und sprachlichen Verstößen
  - Menschliche Plausibilisierung bleibt bei SPS-Semantik notwendig
  - Review-Aufwand verschiebt sich nach vorne und entlastet späte Freigaben
]

#slide[
  == Projektmanagement mit ZenHub

  - Board-Flow: Backlog -> Planned -> In Progress -> Review -> Done
  - Epics für größere Pakete, Roadmaps für Release-Abhängigkeiten
  - Direkte Kopplung von Issues, Branches und Pull Requests

  *Nutzen für O-SW:*
  - Mehr Transparenz bei Prioritäten und Verantwortlichkeiten
  - Weniger Abstimmungsverluste zwischen Technik und Koordination
]

#slide[
  == Einführung und Wissenssicherung

  - Stufenweise Einführung ohne Unterbrechung der Projektarbeit
  - Basisschulung: Branching, PR-Freigabe, ZenHub-Nutzung
  - Begleitete Praxisphasen in laufenden Projekten
  - Wissenspaket im Wiki für Standards und Onboarding
  - Regelmäßige Kurz-Reviews als kontinuierlicher Verbesserungsprozess
]

#slide[
  == Wirtschaftlichkeit

  *Monatliche Zusatzkosten:*
  - Copilot Business + ZenHub: 534,68 EUR

  *Geschätzter monatlicher Nutzen:*
  - Zeiteinsparung Entwicklung + Service: 10.540 EUR

  *Szenarien:*
  - Konservativ (50 % Nutzen): 5.270 EUR
  - Realistisch: 10.540 EUR

  => In beiden Szenarien liegt der Nutzen deutlich über den Lizenzkosten.
]

#slide[
  == Fazit

  - Das Zusammenspiel aus Branching, Copilot-Review und ZenHub ist entscheidend
  - Einzelmassnahmen helfen, volle Wirkung entsteht erst als Gesamtsystem
  - KI-Review erhöht formale Qualität, ersetzt aber keine fachliche Bewertung
  - Langfristiger Erfolg braucht klare Governance, Schulung und kontinuierliche Messung

  #v(0.8em)
  #text(size: 18pt, weight: "bold")[Vielen Dank für die Aufmerksamkeit]
]

#slide[
  == Fragen

  #set align(center + horizon)
  #v(1fr)
  #text(size: 42pt, weight: "bold")[Q and A]
  #v(0.4em)
  #text(size: 20pt, fill: rgb("#6B7280"))[Diskussion und Rückfragen]
  #v(1fr)
]
