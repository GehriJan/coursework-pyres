#import "@preview/charged-ieee:0.1.3": ieee

#set page(numbering: "1")
#show raw: it => text(
      font: "PT Mono",
      it
)
#show link: underline
#show: ieee.with(
  title: [
      Disposition paper for the coursework\ 'Selection of premises for PyRes Automatic Theorem Prover'
    ],
  authors: (
    (
      name: "Jannis Gehring",
      department: [Student id: 6732014, course: INF22B],
      organization: [Baden Württemberg Cooperative State University (DHBW)],
      email: "inf22115@lehre.dhbw-stuttgart.de"
    ),
  ),
  index-terms: (),
  bibliography: bibliography("refs.bib"),
  paper-size: "a4",
  figure-supplement: [Figure],
)

// #set page(columns: 1)
#set text(size: 12pt)
#outline()

= Short description of the work

== Context in terms of content
// - [x] Which topic area is being handled?
// - [x] What is the topic of the work?
// - [x] What is the current situation?
// - [x] What is the goal of the coursework?
// - [x] Which methods are going to be used?
// - [x] Which foundation and framework has to exist?
Automatic theorem provers try to prove the correctness of formal theorems using several strategies and algorithms.
When proving theorems with a big set of logical assertions, one main challenge is the implementation of efficient algorithms to minimize the time, computing power and storage needed for the computation.

There are multiple strategies to achieve this goal. One of them is to restrict the search for the proof to a subset of _relevant_ clauses.
Relevant clauses can be determined with different heuristics.

Some of them compute relevant clauses by measuring how many and which symbols they share with certain other clauses.
Another defines them by finite models, with the set of the relevant clauses sharing models with the theorem.
It is also possible to model relevance with machine learning approaches like a Bayesian learning system.

The alternating path relevance approach determines relevance by constructing a graph modelling all symbols of all clauses. Links are defined either by switching the symbol within the clause or by a possible unification with another clause.
Using this graph, a _relevance distance_ can be computed. The set of clauses can now be filtered for clauses with a maximum relevance distance to the theorem.

There do exist implementations of this approach, but they only filter for _relevance connectedness_ ($<=> "relevance distance" < oo <=> exists "path between clauses"$).

== Goal
Goal of the coursework is
1. the *first implementation of selection of relevant clauses with a specified relevance distance* and
2. the *evaluation of this approach regarding metrics like efficiency and performance*

== Context in terms of project
The algorithm shall be implemented for _PyRes_, a resolution based theorem prover for first-order logic developed in Python.
PyRes values readability over efficiency, which is why the algorithm should be implemenented in an understandable and well-documented fashion.

The algorithm can be tested with _StarExec_, a distributed logic solving service developed at the University of Iowa.

TPTP (Thousands of Problems for Theorem Provers) is a collection of problems that serve as test samples.

If the algorithm turns out to perform well, it becomes a candidate for being implemented in _E-Prover_, a efficiency and performance oriented theorem prover developed in C.

= Structure and Schedule

== Development procedure
The key steps of the development process are as follows:

1. Familiarization
  a. With the theoretical foundations
  b. With the PyRes-codebase
2. Solving the problem by hand -> Defining the algorithm steps
3. Implementation of MVP
4. Evaluating MVP on large dataset of test samples
5. Steps (3.) and (4.) are repeated in an iterative development cycle
6. Final adjustments
7. Final evaluation of algorithm
  a. Identification of theoretical and technical bottlenecks

The coursework shall be written alongside the development. The introduction chapters can be written and finished withing the development phase; the main part is not going to include every single adjustments made, therefore it will be written with a certain delay regarding the development to identify key adjustments.

== Central milestones
The first big milestone will be solving the problem by hand. This will determine, how the algorithm is going to be shaped.
Another main milestone is the evaluation of the first MVP. These results will guide the further development.

== Structure of coursework
The provisional structure of the coursework is as follows:

- Introduction
- Theory
  - First-order logic
  - Current scientific landscape for clause selection
  - Alternating path theory
- PyRes architecture
- Design
  - Initial algorithm
    - Ideas
    - Result
- Implementation
  - Original algorithm in practice
  - [Main improvement 1]
  - [Main improvement 2]
  ...
  - [Main improvement N]
  - Main development drawbacks
- Evaluation & validation
  - Implementation validation
  - Experimental setup
  - Experimental result
- Future work
- Conclusion

- [x] Identification of key steps
- [x] Milestones, consequences and chances of the milestones
- [ ] time schedule for finishing work and coursework
- [x] First structure of coursework, including chapters and sub-chapters

= Basic Literatur

- [ ] Proofs for the current situation
- [ ] Who has worked on similar topic areas?
- [ ] How does the coursework fit into the scientific landscape and what is new?
- [ ] What is being improved by the solution and how is this proven?