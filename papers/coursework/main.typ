#import "typst-dhbw-template/lib.typ": *

#import "acronyms.typ": acronyms
#import "glossary.typ": glossary
#import "config.typ": *

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

#show math.equation: it => [ #math.bold(it) ]

This chapter contains the underlying first-order predicate logic definitions and a short introduction to binary resolution. We start from the basic context of predicate logic.\

_Term_ constitute elements of the corresponding domain and consist of variables, functions and constants.
_Variables_ are denoted with the letters $x, y, z, x_1, y_2, ...$.
_Functions_ are denoted with the letters $f, g, h, ...$. A function of the form $f(t_1, t_2, ..., t_n)$ (with $t$ being terms) has an associated arity of $n$.
_Constants_ are denoted with the letters $a, b, c, ...$ and represent a special case of functions with arity 0.

_Predicates_ are denoted with $P, Q, R, ...$. They map (tuples of) terms to boolean truth values. The concept of function-arity is extended to predicates accordingly.
An _atom_ consists of a predicate $P$ and the corresponding terms.
A _formula_ is either an atom or the combination of atoms with logical operators ($not, and, or, ->, <->$) or quantors ($forall, exists$).

A _literal_ is either an atom or a negated atom.
A _clause_ is a set of literals interpreted as the conjunction of those.
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

== PyRes in constrast to other theorem provers
A lot of modern theorem provers, i.e. E, Vampire and SPASS, are built with low-level languages like C and C++ (@e_gh @vampire_gh @spass_gh). They employ optimized data structures and complex algorithms to increase their performance.
Other provers like iprover @iprover_gh are implemented in lesser-known languages like OCamL.
Both approaches make it harder for new developers to understand the codebase and functionality, hence hindering further developement. This also leaves the didactic potential of theorem provers unused.

PyRes, on the other hand, is explicitly built for readability.
Extensive documentation and the choice of an interpreted language enable a step-by-step understanding of the functionality.
Its architecture and calculus is similar to other theorem provers, making it a suitable entry for understanding a multitude of provers. @teaching_by_example

Whilst PyRes doesn't have as much extensions for optimization than other provers, this simplicity makes it a good candidate for implementing and evaluating new approaches (like alternating path theory in this case).

== PyRes architecture
PyRes heavily builds upon Python's support for object orientation




- Lexer
  - Token

- Term
- Literal
- Clause
- Formula


















