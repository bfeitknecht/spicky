#import "../src/lib.typ": *

#set page(paper: "a4", margin: 2cm, numbering: "1")
#set text(font: "New Computer Modern", size: 10pt, lang: "en")
#set heading(numbering: "1.")
#set par(justify: true, leading: 0.7em)

#align(center)[
  #text(size: 32pt, weight: "bold", fill: rgb("#283653"))[spicky]
  #linebreak()
  #text(size: 13pt, fill: rgb("#526078"))[A compact toolkit for clear cheatsheets]
]

#v(1em)

= Overview

Spicky provides a compact landscape page preset and a handful of composable helpers for notes and reference sheets. Import the package, configure the document with `conf`, then write ordinary Typst headings, equations, tables, and content blocks.

```typ
#import "@preview/spicky:0.2.0": *

#show: conf.with(
  title: "My Cheatsheet",
  authors: ("Your Name",),
  columns: 3,
)
```

= Page configuration

`conf` accepts the document metadata and exposes the most commonly tuned layout values:

- `columns`, `margin`, and `gutter` control the compact multi-column layout.
- `font`, `size`, and `lang` set the text defaults.
- `page-numbering` and `heading-numbering` customize the page footer and heading counters.
- `flipped` controls landscape orientation.

All values have defaults, so the minimal form `#show: conf` is also useful for quick drafts. Content after the show rule is passed through as the document body.

= Content blocks

Use the three semantic boxes to visually distinguish types of notes. Each helper accepts a title and body, with an optional footer as a third content argument.

#definition[Definition][
  A definition gives a concise, reusable statement of an idea.
][
  Use the footer for a short caveat, reference, or memory aid.
]

#example[Example][A concrete example makes the definition easier to apply.]

#recipe[Recipe][List steps, transformations, or a short procedure.]

Pass named options such as `fill`, `border-color`, `radius`, and `inset` to adjust a single box. `container` is available for a fully custom box.

= Tables and pseudocode

`grid` is a convenience wrapper over `tablem`; provide ordinary Typst table rows and the usual table options:

```typ
#grid(
  columns: (1fr, 2fr),
  [*Symbol*], [*Meaning*],
  [$alpha$], [First item],
  [$beta$], [Second item],
)
```

`pseudo` and `pseudocode` are equivalent aliases for Lovelace's pseudocode list. The module also re-exports selected helpers from Showybox, Tablem, Syntree, Finite, Lilaq, and Fletcher for convenient access. Refer to those packages' documentation for their options and behavior.

= Compatibility

The package is tested with Typst 0.13.1 through 0.15.1. Its helpers are deliberately thin: package-specific APIs and compatibility remain governed by the upstream dependencies listed in `src/lib.typ`.
