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
#show math.equation: it => [ #math.bold(it) ]

This chapter contains the underlying first-order predicate logic definitions and a short introduction to binary resolution. We start from the basic context of predicate logic.\

A _term_ constitutes an element of the corresponding domain and consists of _variables_, _functions_ and _constants_.\
_Variables_ are denoted with the letters $x, y, z, x_1, y_2, ...$.\
_Functions_
_Constants_



// A _signature_ consists of a set of function symbols $F$ and a set of predicates $P$.\
// _Functions_ map elements of $D$ (or tuple of such) on to other elements of $D$.\
// _Constants_ are functions with arity 0.\
// We also assume a set $X$ of _variables_.\
// Functions, constants and variables can be put together to form _terms_, which correspond to elements of the domain set $D$.\

// _Predicates_ map


// We usually use $f, g, h, ...$ to denote

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












