#import "@preview/showybox:2.0.4": showybox
#import "@preview/tablem:0.3.0": tablem
#import "@preview/lovelace:0.3.1": pseudocode-list
#import "@preview/syntree:0.3.1": listtree, syntree
#import "@preview/finite:0.5.1": automaton
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

#let conf(
  title: [],
  authors: (),
  description: none,
  doc,
) = {
  set page(
    flipped: true,
    numbering: "1",
    number-align: right,
    columns: 3,
    margin: (rest: 0.635cm),
    footer-descent: 0cm,
  )

  set document(
    title: title,
    author: authors,
    description: description,
  )

  set text(
    font: "New Computer Modern",
    lang: "en",
    size: 8pt,
  )

  set heading(numbering: "1.1.1.")
  set columns(gutter: 3%)

  doc
}

#let container(fill: white, ref: str, title, body) = {
  set heading(numbering: none)

  showybox(
    frame: (
      border-color: black,
      body-color: fill,
      title-color: fill,
      thickness: 1pt,
      radius: 3pt,
      inset: 5pt,
    ),
    sep: (
      dash: "dotted",
      thickness: 1pt,
    ),
    title-style: (
      sep-thickness: 0pt,
      color: black,
      boxed-style: (
        anchor: (
          x: left,
        ),
        radius: 3pt,
      ),
    ),
    footer-style: (
      sep-thickness: 2pt,
      color: black,
    ),
    breakable: false,

    [
      #underline[#title]
      #body
    ],
  )
}

#let definition(title, body) = container(fill: white.darken(20%), title, body)
#let example(title, body) = container(fill: white.darken(10%), title, body)
#let recipe(title, body) = container(fill: white, title, body)

#let grid = tablem.with(
  render: (columns: auto, align: auto, ..args) => {
    table(
      columns: columns,
      stroke: (x, y) => (
        left: if x > 0 { 0.5pt },
        top: if y > 0 { 0.5pt },
      ),
      align: center + horizon,
      ..args,
    )
  },
)

#let pseudo = pseudocode-list
