#import "template.typ": *
#import "todo.typ": todo

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: preamble.with(
  date: [#datetime.today().display("[month]/[day]/[year]")],
  title: "Implementing a Strategy for Clause Selection with Alternating Path Theory for Automatic Theorem Proving In Python",

  // Autoreninfos
  author: "Jannis Gehring",
  studiengang: "Computer Science",
  degree: "Bachelor of Science",
  matrikelnummer: 6732014,
  kurs: "TINF22B",

  // Infos zur Arbeit
  art: "Coursework",
  bearbeitungszeitraum: "09/30/2024 - 06/12/2025",
  betreuer: "Prof. Dr. Stephan Schulz",
  confidential: 1,

  abstract: [#lorem(100)]
)

 // Auskommentieren, um Umfang des reinen Texts zu sehen.
 // #show figure: none


= Einleitung

Dieses Kapitel leitet in die theoretischen Grundlagen und Hintergründe der Arbeit ein. Dabei wird sowohl auf das Themenfeld von automatischen Theorembeweisern als auch auf genetische Algorithmen eingegangen.

== Automatische Theorembeweiser

Ein automatischer Theorembeweiser ist eine Software, welche anhand eines gegebenen Satzes von Axiomen nachweist, dass eine bestimmte Aussage zutrifft.

Speziell für die Prädikatenlogik erster Stufe gibt es eine Vielzahl an Beweisern @VAMPIRE @GCAI2015:Breeding_Theorem_Proving_Heuristics @SPASS. Diese versuchen meist, die Aussage, dass aus den Axiomen die zu beweisende Aussage folgt, zu einem Widerspruch zu führen. Dazu nutzen sie Verfahren wie Resolution oder Superposition Calculus @bachmair_rewrite-based_1994.

Diese Systeme unterstützen auch Prädikatenlogiken höherer Stufe oder spezielle Einschränkungen wie Prädikatenlogik mit Gleichheit.

=== Der Theorembeweiser E

Der Theorembeweiser E @E_2.3 ist ein von _Stephan Schulz_ entwickelter Theorembeweiser für die vollständige Prädikatenlogik erster Stufe, unterstützt aber auch monomorphe höherstufige Prädikatenlogik mit Gleichheit. Er akzeptiert eine Problemspezifikation, die typischerweise aus einer Anzahl von Klauseln oder Formeln sowie einer Vermutung besteht.

Der Theorembeweiser liest das Problem ein und übersetzt es in konjunktive Normalform. In einer optionalen Vorverarbeitung wird das Problem nochmals vereinfacht. Danach wird ein Superposition-Calculus-Algorithmus @bachmair_rewrite-based_1994 angewendet, der versucht, aus der Klauselmenge die leere Klausel abzuleiten. Gelingt dies, ist das übersetzte Problem unerfüllbar.

Wichtig ist hier vor allem, dass alle Beweisschritte in der Praxis recht komplex sind und durch eine sehr große Zahl an Konfigurationsparametern verschiedener Datentypen konfiguriert werden können. Eine passende Wahl dieser Konfigurationsparameter ist dabei entscheidend für den Erfolg des Beweisers. Aufgrund der Komplexität des Gesamtsystems ist es jedoch nicht mehr möglich, mit theoretischen Mitteln zu erschließen, was der optimale Satz an Konfigurationsparametern ist. Dies hängt möglicherweise auch von der Art des Problems ab.


=== Evaluation von Theorembeweisern: TPTP

Zum Vergleich von Theorembeweisern, aber auch zur Evaluation während der Entwicklung, ist ein Satz von Problemen hilfreich. #acr("TPTP") @TPTP_LIB ist eine Sammlung solcher Probleme, welche häufig für das Benchmarking von Prover-Systemen herangezogen wird.

Das Projekt definiert dabei auch einen einheitlichen Standard @TPTP_LANG zur strukturierten Beschreibung solcher Probleme. Dieses Format wird von E als direktes Eingabeformat für Probleme akzeptiert ~@E_2.3.

== Evolutionäre Algorithmen

Dieses Kapitel beschreibt die Grundlagen evolutionärer Algorithmen. Dieser Abschnitt geht insbesondere auf die Begrifflichkeiten und Methoden ein. Darüber hinaus wird auf die Implementierung und insbesondere die Programmbibliothek #acr("DEAP") eingegangen.

=== Allgemeines

Evolutionäre Algorithmen (EA) sind eine Klasse von Optimierungsverfahren, die sich an den Prinzipien der natürlichen Evolution orientieren, wie sie in der Biologie vorkommen. Sie basieren auf Konzepten wie Selektion, Mutation, Rekombination (Crossover) und Überleben des Stärkeren. Diese Algorithmen werden häufig für komplexe Optimierungsprobleme eingesetzt, bei denen herkömmliche mathematische Ansätze schwer anzuwenden sind. @Weicker2015

=== Grundlegender Ablauf

Evolutionäre Algorithmen beginnen mit der zufälligen Initialisierung einer Population von Lösungen. In jeder Iteration werden die Individuen anhand einer Fitnessfunktion bewertet. Die besten Lösungen werden ausgewählt, kombiniert und mutiert, um neue Individuen zu erzeugen. Anschließend wird die Population aktualisiert, und der Prozess wiederholt sich, bis eine Abbruchbedingung erfüllt ist.

#figure(
  caption: [Pseudocode evolutionäre Algorithmen],
  placement: none
)[
```python
population = initialize_population(size=100)
while not termination_condition():
    fitness = [evaluate(ind) for ind in population]
    # selection, mutation und crossover
    selected = select(population, fitness)
    offspring = crossover(selected)
    offspring = mutate(offspring)
    population = replace(population, offspring)
```]

== Begriffe
Das Nachfolgende Dokument verwendet dabei insbesondere die folgenden Begriffe verwendet:

- *Initialisierung*: Eine Population von Individuen (Lösungen) wird zufällig erzeugt.
- *Fitnessbewertung*: Jedes Individuum wird anhand einer Fitnessfunktion bewertet, die angibt, wie gut es das Problem löst.
- *Selektion*: Individuen mit hoher Fitness werden bevorzugt ausgewählt, um Nachkommen zu erzeugen.
- *Rekombination* (Crossover): Zwei oder mehr Individuen kombinieren ihre Merkmale, um neue Individuen zu erzeugen.
- *Mutation*: Kleine zufällige Änderungen werden an den Nachkommen vorgenommen, um die genetische Vielfalt zu erhöhen.
- *Ersatz*: Die neue Population ersetzt die alte, wobei oft die besten Individuen erhalten bleiben.
- *Abbruchbedingung*: Der Algorithmus endet, wenn eine zufriedenstellende Lösung gefunden wurde oder eine vorgegebene Anzahl von Iterationen erreicht ist.

=== Arten von Evolutionäre Algorithmen

== Ähnliche Arbeiten

= Architektur

== Fitnessfunktion

=== Auswahl der Evaluationsprobleme
=== Auswechseln der Evaluationsprobleme

== Crossover- und Mutationsoperatoren
== Der Optimierungsalgorithmus

= Implementierung

== Grundlegende Infrastruktur und Ausführungsumgebung
== Zeitmessung
== Umgang mit verschiedenen Datentypen der Suchparameter
== Parameterbereiche für Suchparameter
== Unittests und Validirung von Suchparametern
== Herausforderungen bei der Implementierung

= Auswertung

= Fazit

== Zusammenfassung der Ergebnisse
== Ausblick auf zukünftige Arbeiten
== Reflexion

