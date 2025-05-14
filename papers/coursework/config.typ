#import "@preview/ctheorems:1.1.3": *
#import "typst-dhbw-template/lib.typ": *
#import "@preview/cetz:0.3.4": canvas, draw
#import draw: line, content, rect, on-layer




#let header-config = (
  display: true,
  show-left-logo: false,
  show-right-logo: false,
  show-divider: false,
  show-chapter: true,
)



// ctheorems
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#f3f3f3"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox(
  "definition",
  "Definition",
  inset: (x: 1.2em, top: 1em, bottom: 1em),
  fill: rgb("#f8f8f8"),
)
#let example = thmbox("example", "Example", fill: rgb("#f0f0f0")).with(numbering: none)
#let proof = thmproof("proof", "Proof")
