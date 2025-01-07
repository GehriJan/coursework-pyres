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

#outline()
= Short description of the work

- What is the topic of the work?
- What is the current situation?
- Which topic area is being handled?
- Which foundation and framework has to exist?
- What is the goal of the coursework?
- Which methods are going to be used?

= Structure and Schedule

- Identification of key steps
- Milestones, consequences and chances of the milestones
- time schedule for finishing work and coursework
- First structure of coursework, including chapters and sub-chapters

= Basic Literatur
- Proofs for the current situation
- Who has worked on similar topic areas?
- How does the coursework fit into the scientific landscape and what is new?
- What is being improved by the solution and how is this proven?