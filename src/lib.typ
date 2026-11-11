#import "@preview/showybox:2.0.4": showybox
#import "@preview/tablem:0.3.0": tablem
#import "@preview/lovelace:0.3.1": pseudocode-list
#import "@preview/syntree:0.3.1": listtree, syntree
#import "@preview/finite:0.5.1": automaton
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node

// Preserve access to the standard column-layout rule inside `conf`, whose
// public `columns` option intentionally has the same name.
#let _apply-columns = columns

// Set up a compact, multi-column cheatsheet. Pass additional content after
// `#show: conf.with(...)` as normal Typst document content.
#let conf(
  title: [],
  authors: (),
  description: none,
  columns: 3,
  margin: 0.635cm,
  gutter: 3%,
  font: "New Computer Modern",
  size: 8pt,
  lang: "en",
  page-numbering: "1/1",
  heading-numbering: "1.1.1.",
  flipped: true,
  doc,
) = {
  set page(
    flipped: flipped,
    numbering: page-numbering,
    number-align: right,
    columns: columns,
    margin: (rest: margin),
    footer-descent: 0cm,
  )

  set document(
    title: title,
    author: authors,
    description: description,
  )

  set text(
    font: font,
    lang: lang,
    size: size,
  )

  set heading(numbering: heading-numbering)
  set _apply-columns(gutter: gutter)

  doc
}

// A compact content box, kept together by default, used by the semantic helpers.
#let container(
  fill: rgb("#f5f6fa"),
  border-color: rgb("#526078"),
  thickness: 0.8pt,
  radius: 3pt,
  inset: 5pt,
  breakable: false,
  title,
  body,
  ..rest,
) = {
  set heading(numbering: none)

  showybox(
    frame: (
      border-color: border-color,
      body-color: fill,
      title-color: fill,
      thickness: thickness,
      radius: radius,
      inset: inset,
    ),
    sep: (
      dash: "dotted",
      thickness: 1pt,
    ),
    title-style: (
      sep-thickness: 0pt,
      color: rgb("#202a3b"),
      boxed-style: (
        anchor: (x: left),
        radius: radius,
      ),
    ),
    footer-style: (
      sep-thickness: 2pt,
      color: border-color,
    ),
    breakable: breakable,
    spacing: 0.75em,
    [
      #underline[#title]
      #body
    ],
    ..rest,
  )
}

#let definition(
  title,
  body,
  fill: rgb("#eaf0ff"),
  border-color: rgb("#536da6"),
  ..rest,
) = container(fill: fill, border-color: border-color, title, body, ..rest)

#let example(
  title,
  body,
  fill: rgb("#edf6ef"),
  border-color: rgb("#5d8066"),
  ..rest,
) = container(fill: fill, border-color: border-color, title, body, ..rest)

#let recipe(
  title,
  body,
  fill: rgb("#fff5e8"),
  border-color: rgb("#a77942"),
  ..rest,
) = container(fill: fill, border-color: border-color, title, body, ..rest)

// Keep tablem's row/column controls while applying a readable cheatsheet grid.
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

// Short, backwards-compatible alias plus a descriptive spelling.
#let pseudo = pseudocode-list
#let pseudocode = pseudocode-list
