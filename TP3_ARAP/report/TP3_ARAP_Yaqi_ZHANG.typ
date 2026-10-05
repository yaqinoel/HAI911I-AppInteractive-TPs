#let report-title = "TP n°3 : Déformation de surfaces - ARAP"
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

#link("https://github.com/yaqinoel/HAI911I-AppInteractive-TPs/tree/d7e661af8d6b47a483b94e284da311ef17ddea67/TP3_ARAP")[Lien vers le code sur GitHub (cliquez pour visiter)]

#v(0.5cm)

= Système Linéaires

== Exercice 1

La résolution du système donne les valeurs suivantes :
$ x_0 = 1/2, x_1 = 1/2, x_2 = -1/2 $


== Exercice 2

$ A =  mat(1,1,0; 0,1,1; 1,0,1), b = vec(1,0,0) $

== Exercice 3

La résolution numérique donne les valeurs $0.5$, $0.5$ et $-0.5$, identiques à celles obtenues à la main.

#report-image-row(
  (
    "figures/linearSystem.png",
  ),
  (
    [],
  ),
  height: 4cm,
  caption: [Résultat de la résolution numérique du système linéaire.],
)


== Interactions utilisateurs

#report-image-row(
  (
    "figures/interactionUser.png",
  ),
  (
    [],
  ),
  height: 4cm,
  caption:[Contrôles colorés et déplacement d'une main.],
)


= Déformation ARAP

#report-image-row(
  (
    "figures/arap_init.png",
    "figures/arap_move_left.png",
    "figures/arap_move_right.png",
  ),
  (
    [Pose initiale],
    [Bras relevé à gauche de l'image],
    [Autre pose déformée],
  ),
  height:4cm,
  caption:[Pose initiale et deux résultats de déformation ARAP.],
)

= Sélection par sphère

#report-image-row(
  (
    "figures/sphere_select_small.png",
    "figures/sphere_select_big.png",
    "figures/sphere_unselect.png",
  ),
  (
    [Sélection avec un petit rayon],
    [Augmenter le rayon],
    [Retrait de sommets sélectionnés],
  ),
  height:4cm,
  caption:[Sélection sphérique : variation du rayon et retrait de sommets.],
)
