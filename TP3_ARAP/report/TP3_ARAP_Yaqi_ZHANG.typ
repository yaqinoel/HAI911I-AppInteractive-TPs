#let report-title = "TP n°3 : D´eformation de surfaces - ARAP"
#let student-name = "Yaqi ZHANG"
#let report-date = datetime.today().display("[day] [month repr:long] [year]")

#set document(title: report-title, author: student-name)

#set page(
  paper: "a4",
  margin: (top: 2.4cm, bottom: 2.4cm, x: 2.3cm),
  numbering: "1",
)

#set text(font: "Libertinus Serif", size: 11pt, lang: "fr")
#set par(justify: true, leading: 0.65em, first-line-indent: 1.2em)
#set heading(numbering: "1.")
#set figure(supplement: [Figure])

#let report-figure(path, caption, width: 90%) = figure(
  image(path, width: width),
  caption: caption,
)


#let report-image-row(paths, subtitles, height: 4cm, caption: none) = figure(
  grid(
    columns: paths.len(),
    gutter: 0.45em,
    ..range(0, paths.len()).map(index => align(center)[
      #stack(
        dir: ttb,
        spacing: 0.4em,
        image(paths.at(index), height: height),
        text(size: 9pt)[#subtitles.at(index)],
      )
    ]),
  ),
  caption: caption,
)

#align(center)[
  #v(1.3cm)
  #text(size: 17pt, weight: "bold")[#report-title]

  #v(0.7cm)
  #student-name

  #v(0.35cm)
  #report-date
]



#v(0.5cm)

#link("https://github.com/yaqinoel/HAI911I-AppInteractive-TPs/tree/70b9c99520fcd85797fb4fd48504ac2630d0505d/TP3_ARAP")[Line du code sur github (Cliquez pour visiter)]

#v(0.5cm)

= Système Linéaires

== Exercice 1

En résolvant le système d'équations, le résultat est suivant:
$ x_0 = 1/2,  x_2 =1/2 , x_3 = -1/2 $


== Exercice 2

$ A =  mat(1,1,0; 0,1,1; 1,0,1), b = vec(1,0,0) $

== Exercice 3

#report-image-row(
  (
    "figures/linearSystem.png",
  ),
  (
    [x],
  ),
  height: 4cm,
  caption: [xx],
)

== Interactions utilisateurs