# Meetingnotizen

## Meeting 11.10.2024
### Wiss. Arbeit:
- Was heißt Length n Refutation? -> anzahl der resolutionsschritte
- Was genau sind Grundinstanzen?
  -> instanz ohne variablen (theorem von herbrand: rückführen von prädikatenlogik auf aussagenlogik durch substitutionen zu grundinstanzen)
  ( a computing procedure for quantification)
  dpll verfahren

### PyRes:
- Simple
    - processClause() -> warum muss FreshVarCopy gemacht werden? -> deckt sonst nur Fall ab, dass beide variablen gleich sind
    - Was genau hat es mit isInferenceLit() auf sich? wäre das vielleicht eine Möglichkeit, relevante Klauseln auszuwählen? -> wäre eine Erweiterung
- FoF
    - was macht eine "bessere" Klausel aus? -> unterschiedliche möglichkeiten: symbol counting, älteste klausel
    - Die meisten Add-Ons (subsumption, tautology) werden bei processClause gemacht, oder?
        - nur EqAxioms nicht

### Next Steps:
1. Pseudo-Code definieren
    - erst kompletten Graph aufbauen
        - wie sieht der aus? relevance connected ist ja nicht transitiv
        - ist nur der Wert wichtig oder auch der Weg? iff ist der Weg nachher fürs Beweisen wichtig?
        - for each clause in S'
        -   for each clause in S\S'
        -       compute Relevance
    - dann R_{n,S}(S') paralell berechnen
    -> dann müssen die Abstandsberechnungen nur einmal durchegeführt werden und nicht immer wieder neu.
    Terminierung: entweder über n oder, dass der Graph ausgeschöpft ist.
2. Algorithmus von Hand durchführen 
3. MVP
    - in simple integrieren -> wo? vor .saturate()? -> ja mit  isInferenceLit? -> erst mal nicht oder eigene Datenstruktur hinzufügen? -> als methode von Proofstate
4. Rahmendokument machen
   quasi als vor-Disposition-paper -> 01.11.-07.11.

## Meeting 05/11/ 17:45

### Aktueller Stand
- Algorithmus von Hand auf `EXAMPLES/PUZ002-1.p` durchgeführt
    1. Graph erstellen
        1. Nodes definieren
        2. Edges innerhalb von Clauses definieren
        3. Edges zwischen Clauses definieren
    2. Breadth-First-Search
    -> Wenn ich 1000 Klauseln hab, muss dann der Graph für alle Tausend Klauseln erstellt werden?
- Ersten Draft implementiert
    - auf git pushen? eigener branch?


### Notizen wähxrenddessen
- aktuelle Version richtiges Endergebnis -> [SZSOntology](https://tptp.org/cgi-bin/SeeTPTP?Category=Documents&File=SZSOntology)
- metriken definieren und implementieren
- auf TPTP testen -> [TPTP website](https://tptp.org/TPTP/)
    - mit "-" und "+" ist für uns relevant
        - FOF: Dateiname mit "+"
        - CNF: Dateiname mit "-"
    - mit starexec miami testen
        - [link](https://starexec.ccs.miami.edu/starexec/)
        - zugriff mit verweis auf Pyres - studienarbeit - schulz beantragen
- neuen Termin ausmachen
- neue Version performanter implementieren
- 


## Meeting 17/01/ 16:00

### Aktueller Stand
- MVP soweit fertig, aber noch nichts fürs Testen vorbereitet
    - welche konkreten Schritte vor testen noch notwendig?
    - wie testen?

### Fragen
- Ließt er die Studienarbeit Probe und gibt Feedback? -> Angebot: jeder Teil wird einmal gelesen
- Dispositions-papier
    - Schreibstil?
    - Hat er Empfehlungen/Anpassungen bzgl. des Zeitplans?

### Meeting währxenddessen

#### StarExec
- StarExec kann den ganzen Output auch ausgeben
- StarExec ist aber nicht optimal für Profiling, das eher lokal mit ausgewählten Problemen
- Auswahl einer guten Profiling lib
- Auswahl "interessanter" Probleme für Profiling
    - Laufzeit:
    - Welche raussuchen, die vllt. so ne sekunde gehen, und welche die so 50-100 sekunden gehen -> 
    - Schulz hat mal alle TPTP auf PyRes laufen lassen -> Siehe Mail
    - Anzahl der Klauseln 
    - mittelmäßig viele -> viele sind too much für Python
    - kann aus TPTP beschreibung "number of formulae" gezogen werden
    - keine Gleichheit (bei SPC -> EQ = gleichheit; iwas mit N ist ohne Gleichheit)
- StarExec how to 
    - "Make starexec" macht das fertige Ding für Starexec `~/StarExec/PyRes.zip`
    - alles mit Form `starexec_run_...` kann als version ausgewählt werden.
  - Roadmap
    1. Auf Starexec laufen lassen ohne Optimierung
    2. Profiling lokal -> optimierungen
    3. Auf Starexec laufen lassen mit Optimierung

#### PyRes code
- GraphViz anstatt mermaid implementieren?

## Meeting 31/01 18:00 Uhr

### Infos 
- Profiling berichten

### Fragen
- Optimierung des Verfahrens wird ein großer Teil sein. Wie/ nach welchem Schema/ mit welcher Zielsetzung soll optimiert werden?
    - Soll ich auch auf technischer Ebene optimieren, vorallem, wenn es die Lesbarkeit verschlechtert?
        - Beispiel:
        ```py
            # Schneller:
            def isNeighbouringEdgeOfSubset(edge: Edge, subset: list[Node]) -> bool:
                containsFirst = subset.__contains__(edge.node1)
                containsSecond = subset.__contains__(edge.node2)
                return (
                    containsFirst and not containsSecond 
                    or containsSecond and not containsFirst
                )
            
            # Schöner:
            def edge_neighb_of_subset(edge: Edge, subset: list[Node]) -> bool:
                return (edge.node1 in subset) != (edge.node2 in subset)
        ```
    - -> Set oder Dict anstatt List bei subset wählen!!!
    - Eher algorithmisch anstatt technisch optimieren -> bspw. O(n) durch O(1) Operationen ersetzen
    - Ein paar Probleme als Benchmark wählen
- Wie verhält es sich mit Nutzung von ChatGPT? -> [Richtlinie](https://www.dhbw-stuttgart.de/studierendenportale/informatik/Dokumente/genai_dhbw.pdf)

- Wie kann ich mir den Output von starexec ausgeben? 
    - Unter Provers -> Configuration -> flags= können command line argumente ausgegeben werden
    - Unter Jobs -> actions/job output wird eine dateistruktur heruntergeladen, die den kompletten output umfasst
    - skript von Herr Schulz fetcht die ganzen Ergebnisse aus der Dateistruktur raus.

- Fungiert alternating path wirklich nur als Filter vor dem Reasoning?
    - Jetzt für die Analyse macht es doch mehr Sinn wenn man den Abstand jeweils inkremenentiert und ausprobiert,
    bis es funktioniert?
    - Auch später macht das doch mehr Sinn, weil er dann auf jeden Fall ne Lösung findet?

- Welche Art von Problem soll ich wählen?
  - Welcher Präfix?
    - Präfix sagt nur Domäne
      - CSR sind teilweise sher groß
    - -> "-" und "+" kann der Pyres, rest nicht
  - Was ist mit EQ?
    - PyRes Kalkül kann EQ nicht, aber Gleichheit kann über preprocessing über Gleichheitsaxiome abgebildet werden. Das lässt aber die Kombinationsmöglichkeiten explodieren und im Falle vom Graph wird dieser hierdurch evtl. zusammengeklebt.
    - Wäre aber interessant für eine spätere Untersuchung!!! 

- Gibt es mehrere Probleme für eine Wissensbasis?
  - Nicht direkt, aber indirekt über die include statements
  - Das gabs mal als eine eigene Kategorie bei den Wettbewerben (Large Theory patch division)

- Muss ich alle Dateien einzeln bei StarExec hochlagen?
    - Nein. Man kann sich Problem-Bundles (bspw. ganz TPTP) von einem anderen User rein-verlinken. Herr Schulz macht das mal ausfindig

## Meeting 21.03. 13:30 Uhr

### Informationen

#### Programmieren
- Ziel: Die Performance der AP auf dem PyRes evaluieren und verbessern
  - Weg1: Testen auf Starexec und Evaluation der Zeit- (und Memory-)komplexität 
    - Problem: Welcher Wert soll für die Relevanzdistanz gewählt werden?
        - Weg: Ausprobieren unterschiedlicher Werte für unterschiedliche Probleme mit Multiprocessing
        - -> Frage trotzdem nicht geklärt
        **- Alternative: eigene Runskripte für unterschiedliche Parameter**
            - pro solver können mehrere Runskripte angelegt werden
        **- Heatmap mit x=problem, y=rel_distance und color=status machen**
  - Weg2: Profiling
  - Problem: Nach welchen Metriken sollen die unterschiedlichen Implementierungen des Pyres bewertet werden?
    **- Ausgabeparameter: Laufzeit für Relevanz-distanz-berechnung**

**Zentrale Fragen:**
**1. Wie zeitintensiv ist die Prämissenselektion? Skalierbarkeit, ...**
**2. Taugt die Prämissenselektion überhaupt was?**

- Welche Python version?
    **-> keine Restriktionen**
- Welche Möglichkeiten gibt es, bei Starexec nach Problemen zu filtern, die PyRes lösen kann?
    **-> im run-script, gibt schon eine E-Implementierung davon**
    **-> schon implementiert**
- Gibt es Probleme, die viele nicht benötigte Klauseln haben?
    **-> CSR haben viele Klauseln**

**NEXT STEPS:**
    **- Rel_distance über run-script spezifizieren**
    **- Parameterspezifikation über print("# key: value") ausgeben**
    **- auf starexec laufen lassen**
    **- analysieren**

#### Studienarbeit
- "Ich" in Paper verwenden? Weil im Englischen ja oft "We" verwendet wird
    **-> "I/We" geht klar, nur nicht random mischen**
- Einleitung erst am Ende schreiben?
- Passt die Gliederung des Dispositionspapiers soweit?
    **- Passt soweit**

### Fragen
- Soll der Pyres am Ende die relevance distance selber wählen?
    **- Optional, guter Bonus** 
- Wie kriegt man den Starexec output wie bei [df_tptp_pyres](../meeting/protocol_default.csv)
    **- über genprot.py**

## Meeting 13.03., 18:00 Uhr

### Implementierung
- [ ] Parametrisierung über Runskripte läuft, runs auf starexec gestartet
- [ ] Ergebnisse siehe Notebook

Aktuelle Offene Dinge:
- [ ] Alle Probleme auf Starexec zu runnen dauert zu lange
    **- `pylib_e_multi.py` im E repo ermöglicht das laufen auf saturn rechner.**
    - [ ] Vorauswahl für Probleme treffen? Besonders relevante Probleme selecten?
        **- Eine Möglichkeit: Mit E ermitteln, bei welchen Problemen wieviele Ausgangsklauseln verwendet werden. -> Vielleicht nächstes Mal angehen**
        **- Andere Möglichkeit: eine problemklasse wählen**
- [ ] Welche SZS Stati sollten in die Berechnung von Metriken einfließen?
  - [ ] GaveUp, Inappropriate, Satisfiable, CounterSatisfiable, Theorem, ResourceOut
  - Siehe `genprot.py -> statusmap, zeile 120`, alle die nicht auf F gemappt werden
- [ ] Welche Metriken soll ich genau berechnen um unterschiedliche Versionen zu evaluieren?
    - Skalierbarkeit
        **- allgemein nicht mean, wegen Ausreißerempfindlichkeit, sondern median**
        **- [ ] Unterschiedliche x_values für GCT: Anzahl clauses, literals oder symbole allgemein**
        **- [ ] x_values für NCT: rel_distance**
    **- Venn diagramm für die Probleme, die vorher und nachher gelöst werden können**

### Studienarbeit

Theoretisches Kapitel:
**- [ ] In Schulz' Doktorarbeit schauen**
- [ ] Gute Primärquelle für FOL und ATP?
    - [ ] _"Melvin Fitting, First-Order Logic and Automated Theorem Proving, Springer Science & Business Media. 1990 ISBN 978-1-4612-2360-3."_ scheint ganz gut zu sein, ist aber kostenpflichtig
        **- [ ] Allgemeine Definitionen gut, für Praxis schlecht**
        **- [ ] Chang und Lee paper, kann Schulz ausleihen**
    **- [ ] Bib über Fernleihe befragen**
- [ ] Brauch ich Literaturverweise für basic logische Terminologie?
    **- [ ] nicht viel, siehe Doktorarbeit**

Sonstiges:
- [ ] Zitieren mit Seitenzahl?
    **- [ ] Eigentlich nicht, eher bei Handbooks wo unterschiedliches zusammengefasst ist**

**NEXT STEPS:**
**- [ ] Starexec schauen, dass es schneller geht**
**- [ ] Studienarbeit weiter schreiben**


## Meeting 26.03., 13:00 Uhr

- Starexec geht wieder wie gedacht
**- Wallclocktime = 2* CPU time setzen**

### Writing
- Pyres beschreibung fast fertig

### Programmierung
- Ansätze
    - Set-based anstatt listen
        - sieht nach gutem Improvement aus
    - Matrix-based
        - gutes Paper gefunden [link](../../papers/literature/3650200.3656600.pdf)

### Sonstiges
- Graph von Alternating Path nicht nur als Filter, sondern auch als Klauselselektionsheuristik?
    **- Problem: was macht man mit neuen klauseln?**
    **- vllt. trotzdem für die ursprünglichen klauseln gut**

**NEXT STEPS**
**- Alte Versionen mit angepasster Wallclock time**
**- Kapiteln in studienarbeit fertig schreiben**
**- Matrix-zeug einarbeiten & implementieren**
