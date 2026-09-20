// Compile: typst compile main.typ report.pdf

#let report-title = "TP n°2 : Développement d’applications Interactives
Animation"
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

// Helper for a single figure.
#let report-figure(path, caption, width: 90%) = figure(
  image(path, width: width),
  caption: caption,
)

// Helper for multiple equally high images, each with its own small subtitle.
// `paths` and `subtitles` must have the same number of elements.
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

// First page header: title, name and date, without a separate cover page.
#align(center)[
  #v(1.3cm)
  #text(size: 17pt, weight: "bold")[#report-title]

  #v(0.7cm)
  #student-name

  #v(0.35cm)
  #report-date
]



#v(0.5cm)

#link("https://github.com/yaqinoel/HAI911I-AppInteractive-TPs/tree/05a91bd2bde802e8f05d82e24775e6bc0866de92/TP2_Animation")[Line du code sur github (Cliquez pour visiter)]

#v(0.5cm)

= Compute skinning weights

#report-image-row(
  (
    "figures/weight_view1.png",
    "figures/weight_view2.png",
  ),
  (
    [],
    [],
  ),
  height: 6cm,
  caption: [Visualisation des poids de skinning : la couleur indique l’influence de l’os sélectionné sur les sommets du maillage.],
)

= Draw transformed mesh

#report-image-row(
  (
    "figures/transform_mesh_n2.png",
    "figures/transform_mesh_n4.png",
    "figures/transform_mesh_n8.png",
  ),
  (
    [n = 2],
    [n = 4],
    [n = 8],
  ),
  height: 6cm,
  caption: [Maillage déformé par linear blend skinning. Quand n augmente, l’influence de chaque os est plus concentrée autour de celui-ci.],
)

= Update IK chain

#report-image-row(
  (
    "figures/IK_view1.png",
    "figures/IK_view2.png",
    "figures/IK_view3.png",
    "figures/IK_view4.png",
  ),
  (
    [Pose initiale],
    [Première position cible],
    [Deuxième position cible],
    [Troisième position cible],
  ),
  height: 5cm,
  caption: [Résultats de la cinématique inverse par CCD : la chaîne osseuse est réorientée pour rapprocher l’articulation sélectionnée de la position demandée.],
)
