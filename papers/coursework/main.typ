#import "typst-dhbw-template/lib.typ": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/algo:0.3.6": algo, i, d, comment, code
#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.3": codly-languages

#import "acronyms.typ": acronyms
#import "glossary.typ": glossary
#import "config.typ": *

#show: codly-init
#codly(languages: codly-languages)

#show: supercharged-dhbw.with(
  title: "Implementing a graph-based clause-selection strategy for Automatic Theorem Proving in Python",
  authors: (
    (
      name: "Jannis Gehring",
      student-id: "6732014",
      course: "TINF22B",
      course-of-studies: "Computer Science",
    ),
  ),
  acronyms: acronyms, // displays the acronyms defined in the acronyms dictionary
  at-university: true, // if true the company name on the title page and the confidentiality statement are hidden
  bibliography: bibliography("ref.bib"),
  date-format: "[month]/[day]/[year]",
  time-frame: "09/30/2024 - 06/12/2025",
  date: datetime.today(),
  glossary: glossary, // displays the glossary terms defined in the glossary dictionary
  language: "en", // en, de
  supervisor: (university: "Prof. Dr. Stephan Schulz"),
  university: "Cooperative State University Baden-Württemberg",
  university-location: "Stuttgart",
  university-short: "DHBW",
  city: "Stuttgart",
  // for more options check the package documentation (https://typst.app/universe/package/supercharged-dhbw)
  header: header-config,
)


= Introduction

= Theory

== #acrf("FOL")

// todo: add definition of:
// - substitution
// - normalization
// - resolution

// #show math.equation: it => [ #math.bold(it) ]

// This chapter contains the underlying first-order predicate logic definitions and a short introduction to binary resolution. We start from the basic context of predicate logic.\

=== Basic #acrs("FOL") terminology

_Terms_ are the most fundamental building block of #acrs("FOL") formulas.
They constitute to elements of the corresponding domain $D$ and consist of variables,
functions and constants.\
We assume a set $V subset D$ of _variables_.
Variables are usually denoted with the letters $x, y, z, x_1, y_2, ...$,
or in #acrs("TPTP") syntax: $X 1, X 2, ...$.\
We also assume a set $F$ of _function symbols_. All functions have the form $f: D^n -> D$, with $n$ being the arity of $f$. Function symbols usually take the letters $f, g, h, ...$. A function and its arity are denoted as $f|_n$.\
_Constants_ represent a special case of functions with arity 0 and take the letters $a, b, c, ...$.\

_Predicates_ are of the form $P: D^n -> {0,1}$. They map (tuples of) domain elements onto truth values. The concept of function-arity is extended to predicates accordingly. They are usually denoted by $P, Q, R, S, ...$\
An _atom_ consists of a predicate $P$ and the corresponding input terms.\
A _formula_ is either an atom or the combination of atoms with logical operators ($not, and, or, ->, <->$) or quantors ($forall, exists$).\
A _substitution_ is a mapping $sigma: V^n -> T^n$ with $n in NN$ and $T$ denoting the set of all syntactically correct terms in the problem context. It is extended from variables to terms, atoms, literals and clauses accordingly.

A _literal_ is either an atom or a negated atom and usually denoted by $l_1, l_2, ... l_n$.\
A _clause_ $C$ is a set of literals ${l_1, l_2, ...,l_n}$. The boolean value of a clause is the disjunction of its literals truth values. Clauses are denoted by $C, D, E,..., C 1, C 2, ...,C N$. The empty clause is denoted by $square$.\


_Example:_
We use the problem "PUZ001-1" of the #acrf("TPTP")-dataset as an example:
 - Variables $V = {x,y}$
 - Functions $F = {}$
 - Constants ${a, b, c}$ (standing for "agatha", "butler" and "charles")
 - Predicates ${H, K, L, R}$ (standing for "hates", "killed", "loves", "richer")

===







#show math.equation: it => [ #it ]

// FOL Definitions
// Definitionen:
// - Domäne
// - Variablen
// - Funktionen (Konstanten)
//   -> Terme
//   - Prädikate
//     -> Atome
//     - Junktoren
//       -> Formel
// - Definition Literal
// - Definition Klausel

//teaching by example:
// - signature
// - functions
// - variables
// - terms
// - constants
// - Atome
// - Literals
// - formula
// - substitution
// - unifier

// FOL Resolution
// - Normalisierung
// - Prozess der Resolution

== Current clause selection strategies



= PyRes
PyRes is an open-source theorem prover for first-order logic.
Its name originates from
#text("Py", weight: "bold")thon, the programming language it is built with,
and the #text("Res", weight: "bold")olution calculus, which it implements for solving #acr("FOL") problems.

== Python

Python is an interpreted high-level programming language. It supports multiple programming paradigms like functional programming and object orientation.
Python was created by Guido van Rossum in the early 1990s @python_history.
Not only is Python easy to learn and read, it also has a lot of packages like Numpy for efficient numerical computations, Pandas for manipulating big datasets, Matplotlib for plotting or TensorFlow and PyTorch for machine learning.
This is why it is still among the most used programming languages.

== PyRes and other theorem provers
A lot of modern theorem provers, i.e. E, Vampire and SPASS, are built with low-level languages like C and C++ (@e_gh @vampire_gh @spass_gh). They employ optimized data structures and complex algorithms to increase their performance.
Other provers like iprover @iprover_gh are implemented in lesser-known languages like OCamL.
Both approaches make it harder for new developers to understand the codebase and functionality, hence hindering further developement. This also leaves the didactic potential of theorem provers unused.

PyRes, on the other hand, is explicitly built for readability.
Extensive documentation and the choice of an interpreted language enable a step-by-step understanding of the functionality.
Its architecture and calculus is similar to other theorem provers, making it a suitable entry for understanding a multitude of provers. @teaching_by_example

Whilst PyRes doesn't have as much extensions for optimization than other provers, this simplicity makes it a good candidate for implementing and evaluating new approaches (like alternating path theory in this case).

== Architecture

PyRes is built with a layered architecture. @teaching_by_example

The bottom layer is a lexical scanner. The classes `Ident` and `Token` allow storing different symbols of #acrs("TPTP") expressions as variables. The class `Lexer` converts strings into sequences of such tokens, allowing further inspection and processing.

The next layer consists of different classes representing #acrs("FOL") objects. Multiple functions implement basic terms with s-expression-like nested lists. The class `Formula` implements atoms as well as complex formulae through a tree-structure.
Terms are also used by the class `Literal` to form literals, which are aggregated to clauses in `Clause`. These themselves are aggregated as sets in `ClauseSet`.

Finally, the classes `SearchParams` and `ProofState` utilize the previously mentioned classes for implementing the given-clause algorithm. Here, the `ProofState` class holds two `ClauseSet`s: One for the processed and one for the unprocessed clauses.

Apart from those, there are multiple modularized components: `signature` provides an explicit signature of the formulae, `unification`, `subsumption`, `substitution`, `derivations` and `resolution` implement the corresponding #acrs("FOL") algorithms. `heuristics` and `indexing` provide different algorithms for optimized clause-selection during resolution.

To ensure an easy learning curve, PyRes comes in three consecutive forms:
1. *`pyres-simple`*, a minimal version for clausal logic.
2. *`pyres-cnf`*, adding heuristics, indexing and sub-sumption
3. *`pyres-fof`*, full support for #acrs("FOL")

== Functionality

PyRes functions as a pipeline. First, the problem is parsed and converted to the data types specified in the previous chapter. If needed (and supported by the specified version), equality axioms are added. Then, the actual reasoning takes place.

At the heart of PyRes is the given-clause algorithm. Here, the clauses are divided into two sets, one for unprocessed and another for processed clauses. In the beginning, all clauses are unprocessed. The algorithm now iteratively selects one of the unprocessed clauses, the _given-clause_, and computes its factors as well as the resolvents between the given-clause and all processed clauses. These new clauses are now added to the unprocessed-clauses set, whilst the given-clause is moved from the unprocessed clauses to the processed clauses. The algorithm ends either if the given-clause is the empty clause (and therefore a contradiction has been found) or the unprocessed-clauses set is empty. @given-clause-simple shows the implementation of the given-clause-algorithm in `pyres-simple`.

If the algorithm found a contradiction, the proof is then extracted. At last, the results are printed.

#figure(
```py
def processClause(self):
    """
    Pick a clause from unprocessed and process it. If the empty
    clause is found, return it. Otherwise return None.
    """
    given_clause = self.unprocessed.extractFirst()
    given_clause = given_clause.freshVarCopy()
    print("%", given_clause)
    if given_clause.isEmpty():
        # We have found an explicit contradiction
        return given_clause

    new = []
    factors    = computeAllFactors(given_clause)
    new.extend(factors)
    resolvents = computeAllResolvents(given_clause, self.processed)
    new.extend(resolvents)

    self.processed.addClause(given_clause)

    for c in new:
        self.unprocessed.addClause(c)
    return None

def saturate(self):
    """
    Main proof procedure. If the clause set is found unsatisfiable,
    return the empty clause as a witness. Otherwise return None.
    """
    while self.unprocessed:
        res = self.processClause()
        if res != None:
            return res
    else:
        return None
```,
caption: [The central functions for the given-clause algorithm in pyres-simple]
) <given-clause-simple>






