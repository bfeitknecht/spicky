// Keep the template artwork at a predictable 3:2 ratio. Typst Universe scales
// thumbnails to a fixed card, so an auto-height strip leaves the mark tiny.
#set page(
  width: 900pt,
  height: 600pt,
  margin: 0pt,
  fill: rgb("#101827"),
)
#set text(font: "New Computer Modern", fill: white)

#align(center + horizon)[
  #block(width: 100%)[
    #align(center)[
      #box(
        width: 112pt,
        height: 112pt,
        radius: 28pt,
        fill: gradient.linear(rgb("#ff7a59"), rgb("#7c5cff")),
      )[
        #align(center + horizon)[
          #text(size: 72pt, weight: "bold", fill: white)[s]
        ]
      ]

      #v(14pt)
      #text(size: 70pt, weight: "bold", fill: white)[spicky]
      #v(8pt)
      #text(size: 22pt, fill: rgb("#c5cede"))[A compact toolkit for clear cheatsheets]
      #v(22pt)
      #box(
        width: 148pt,
        height: 5pt,
        radius: 2.5pt,
        fill: gradient.linear(rgb("#ff7a59"), rgb("#f7c948"), rgb("#55c5a0"), rgb("#7c5cff")),
      )[]
    ]
  ]
]
