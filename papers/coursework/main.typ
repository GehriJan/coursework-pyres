#import "typst-dhbw-template/lib.typ": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/algo:0.3.6": algo, i, d, comment, code
#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.3": codly-languages

#import "acronyms.typ": acronyms
#import "glossary.typ": glossary
#import "config.typ": *

#show: codly-init
#show: thmrules
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

#include "content/01_introduction.typ"

#include "content/02_theory.typ"

#include "content/03_pyres.typ"

#include "content/04_specification.typ"

