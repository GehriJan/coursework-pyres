#import "@preview/codelst:2.0.0": sourcecode
#import "@preview/acrostiche:0.5.0": *


// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let preamble(
  title: "",
  abstract: [],
  author: "",
  matrikelnummer: "",
  kurs: "",
  betreuer: "",
  date: none,
  art: "",
  degree: "",
  studiengang: "",
  // Confidential: 1=none, 2=yellow, 3=red
  confidential: 1,
  bearbeitungszeitraum: "",
  rueckmeldebogen: true,
  body,
) = {
  // Set the document's basic properties.
  set document(author: author, title: title)

  set page(background: if confidential > 1 {rotate(-24deg,
    text(60pt, fill: rgb("FFCBC4"))[
      *VERTRAULICH*
    ]
  )})
  set text(lang: "de")


  // Title page.
  v(1cm)
  place(right, image("assets/DHBW-Logo.svg", width: 40%),)
  v(5cm) // Picture height (approximately)


  v(1.5cm)



  align(center, text(2em, weight: 700, title))

  v(5mm)

  align(center, text(1.3em, weight: 600, art))
  align(center, text(1.1em, degree))

  v(5mm)

  align(center, text(1.1em, "at the course of studies " + studiengang) + "\n at the Cooperative State University (DHBW) Stuttgart" )

  v(5mm)

  v(2em)

  align(center, [von \ *#author*])

  align(center, text(1.1em, date))

  v(1fr)

  place(bottom + center,
    table(
      columns: (35%, 35%),
      stroke: none,
      align: left,
      [Time of project:],[#bearbeitungszeitraum],
      [Student number, course],[#matrikelnummer, #kurs],
      [Supervisor], [#betreuer]))

  pagebreak()

  // Selbstständigkeitserklärung

  set page(numbering: "I von I", number-align: center, background: none)
  set page(margin: (top: 3cm),
  header: [#grid(columns: (75%,  20%), column-gutter: 5%, rows: 3em,
    [#par(leading: 0.65em)[#text(0.9em)[#art #linebreak() #author]]],[#image("assets/DHBW-Logo.svg")])

    #line(length: 100%, stroke: 0.5pt)],
  footer: par(leading: 0.65em)[#text(0.58em)[
    #grid(
      columns: (1fr, 1fr),
      [
        #align(left)[
          As of: #datetime.today().display("[month]/[day]/[year]")
        ]
      ],
      [
        #align(right)[
          Page #context counter(page).display("I")
        ]
      ]
    )
  ]
  ]
  )

  [Selbstständigkeitserklärung des Studenten

  #par(hanging-indent: 1cm, first-line-indent: 1cm, justify: true)[Ich versichere hiermit, dass ich meine Projektarbeit mit dem Thema: _#title _ selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe. Ich versichere zudem, dass die eingereichte elektronische Fassung mit der gedruckten Fassung übereinstimmt, falls beide Fassungen gefordert sind.]]

  v(1cm)

  grid(columns: (45%, 45%), rows: (auto, auto), column-gutter: 10%, row-gutter: 0.5em, line(length: 100%), line(length: 100%), [#align(center,[Ort, Datum])], [#align(center, [Abteilung, Unterschrift])])





  show figure.where(kind: raw): set block(breakable: true)
  set figure(placement: auto)

  if rueckmeldebogen == true {[.]}

  pagebreak(weak: true)

  set page(background: none)

  // Abstract page.
  set par(leading: 15pt, first-line-indent: 2em, hanging-indent: 0em)
  [
    #v(25%)
    #align(center)[
    #heading(
      outlined: false,
      numbering: none,
      [#text(size: 12pt, style: "italic")[*Abstract*]],
    )
    #v(1.5em)
    #abstract
  ]
  ]

  set heading(numbering: "1.1")
  show heading: it => {
    smallcaps(text(size: 1.2em)[#it])
    v(1em)
  }
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    smallcaps(text(size: 1.3em)[#it])
    v(0.2em)
  }

  pagebreak()

  set par(leading: 0.65em, first-line-indent: 0em, hanging-indent: 0em)

  // Table of contents.



  outline(depth: 3, indent: true)
  v(1em)
  par(first-line-indent: 0em, [_Aus Gründen der besseren Lesbarkeit wird auf die gleichzeitige Verwendung der Sprachformen männlich, weiblich und divers (m/w/d) verzichtet. Sämtliche Personenbezeichnungen gelten gleichermaßen für alle Geschlechter._])

  if csv("abbreviations.csv").len() != 0 {
  pagebreak()
  heading(numbering: none, outlined: false, "Abkürzungsverzeichnis")
  table(
    columns: (auto,1fr),
    column-gutter: 2em,
    stroke: none,
    ..csv("abbreviations.csv").flatten(),
  )
  init-acronyms(csv("abbreviations.csv"))
}

  set page(numbering: "1")
  locate(loc => {
  if query(figure.where(kind: image), loc).len() > 0 {
    pagebreak(weak: true)
    outline(target: figure.where(kind: image), title: "Abbildungsverzeichnis")
    v(1em)
    par(first-line-indent: 0em, [_Hinweis: Sofern bei einzelnen Abbildungen keine Quellen angeführt werden, wurden sie vom Verfasser erstellt._])
  }})



  locate(loc => {
  if query(figure.where(kind: table), loc).len() > 0 {
    pagebreak(weak: true)
    outline(target: figure.where(kind: table), title: "Tabellenverzeichnis")
    v(1em)
    par(first-line-indent: 0em, [_Hinweis: Sofern bei einzelnen Tabellen keine Quellen angeführt werden, wurden sie vom Verfasser erstellt._])
  }})

  locate(loc => {
  if query(figure.where(kind: raw), loc).len() > 0 {
    pagebreak(weak: true)
    outline(target: figure.where(kind: raw), title: "Quellcodeverzeichnis")
    v(1em)
    par(first-line-indent: 0em, [_Hinweis: Sofern bei einzelnen Listings keine Quellen angeführt werden, wurden sie vom Verfasser erstellt._])
  }})

  pagebreak(weak: true)

  // Main body.
  set page(footer: par(leading: 0.65em)[#text(0.58em)[
    #grid(columns: (1fr, 1fr), [#align(left)[Stand #datetime.today().display("[day].[month].[year]")]],[#align(right)[Seite #context counter(page).display("1") von #context counter(page).final().last()
  ]])
  ]])
  counter(page).update(1)
  set par(justify: true, leading: 15pt, first-line-indent: 0em, hanging-indent: 0em, spacing: 2em)

  import "@preview/codly:0.2.0" : *

  show: codly-init.with()

  let icon(codepoint) = {
    box(
      height: 0.8em,
      baseline: 0.05em,
      image(codepoint),
    )
    h(0.1em)
  }

  codly(languages: (
    cs: (name: "C#", icon: none, color: rgb("#00884a")),
    sh: (name: "Git Bash", icon: none, color: rgb("#9e2896")),
    xml: (name: "XML", icon: none, color: rgb("#007bc0"))
    // Wenn noch was kommt: Bosch Türkis 50: rgb("#18837e")
  ), zebra-color: white,
  stroke-color: gray
  )

  body

  pagebreak(weak: true)

  set par(justify: false, leading: 0.65em, first-line-indent: 0em, hanging-indent: 0em)

  set heading(numbering: none, outlined: false)

  bibliography("literature.bib", style: "ieee")

  import("anhang.typ"): anhang, enableAnhang

  if(enableAnhang) {
    counter(heading).update(0)
    set heading(numbering: "A.A", outlined: false)
    set par(justify: true, leading: 15pt, first-line-indent: 2em, hanging-indent: 0em)
    pagebreak(weak: true)
    anhang
  }

}