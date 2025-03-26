#import "@preview/ctheorems:1.1.3": *

#let header-config = (
  display: true,
  show-left-logo: false,
  show-right-logo: false,
  show-divider: false,
  show-chapter: true,
)

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")
