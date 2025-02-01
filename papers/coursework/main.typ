#import "typst-dhbw-template/lib.typ": *

#import "acronyms.typ": acronyms
#import "glossary.typ": glossary
#import "config.typ": *

#show: supercharged-dhbw.with(
  title: "Implementing a Strategy for Clause Selection with Alternating Path Theory for Automatic Theorem Proving In Python",
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
== First-order logic
== Current scientific landscape for clause selection
== Alternating path theory
= PyRes architecture
= Design
== Initial algorithm
=== Ideas
=== Result
= Implementation
== Original algorithm in practice
== [Main improvement 1]
== [Main improvement 2]
  ...
== [Main improvement N]
== Main development drawbacks
= Evaluation & validation
== Implementation validation
== Experimental setup
== Experimental result
== Evaluation of the experimental result
= Future work
= Conclusion