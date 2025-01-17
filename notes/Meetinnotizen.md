# Meetinnotizen

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


### Notizen währrenddessen
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
- Ließt er die Studienarbeit Probe und gibt Feedback?
- Dispositions-papier
    - Schreibstil?
    - Hat er Empfehlungen/Anpassungen bzgl. des Zeitplans?
- 
