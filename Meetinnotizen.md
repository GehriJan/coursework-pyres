# Meetinnotizen

## 11.10.2024
### Wiss. Arbeit:
- Was heißt Length n Refutation? -> anzahl der resolutionsschritte
- Was genau sind Grundinstanzen?
  -> instanz ohne variablen (theorem von herbrand: rückführen von prädikatenlogik auf aussagenlogik durch substitutionen zu grundinstanzen)
  ( a computing procedure for quantification)
  dpll verfahren


### PyRes:
Simple
    - processClause() -> warum muss FreshVarCopy gemacht werden? -> deckt sonst nur Fall ab, dass beide variablen gleich sind
    - Was genau hat es mit isInferenceLit() auf sich? wäre das vielleicht eine Möglichkeit, relevante Klauseln auszuwählen? -> wäre eine Erweiterung
FoF:
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
    - 
4. Rahmendokument machen
   quasi als vor-Disposition-paper -> 01.11.-07.11.
