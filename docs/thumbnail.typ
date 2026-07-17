#set page(
  width: auto,
  height: auto,
  margin: 5pt,
  fill: none,
)
#set text(size: 32pt, weight: "bold", font: "CommitMono Nerd Font Mono")
#set align(center + horizon)

#box(
  radius: 32pt,
  fill: red,
  stroke: (
    paint: gradient.linear(..color.map.rainbow),
    thickness: 32pt,
    dash: "dashed",
    cap: "butt",
  ),
  {
    text(
      fill: white,
      stroke: 3pt + gradient.linear(white, black),
    )[
      #underline(stroke: 5pt + gradient.linear(white, black))[*spicky*]
    ]
  },
)
