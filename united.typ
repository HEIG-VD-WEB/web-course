#set text(
  font: "New Computer Modern",
  size: 12pt
)
#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 2cm),
)
#set par(
  justify: true,
  leading: 0.52em,
)

#let name = "Vincent Guidoux"
#let today = datetime.today()

#set page(header: [
  *HEIG-VD*
  #h(1fr)
  _WEB - Fiche d'unité_
  #h(1fr)
  #today.display("[day] [month repr:long] [year]")

  #line(length: 100%)
])

#set page(footer: [
  #line(length: 100%)
  Technologie web 2023-2024
  #h(1fr)
  #counter(page).display(
    "1/1",
    both: true,
  )
])


#align(center)[

= Technologies web

== Fiche d'unité

=== #today.display("[day] [month repr:long] [year]")
]
== Connaissances préalables recommandées

#linebreak()

La personne qui étudie doit connaître et savoir utiliser les notions suivantes :

- programmation orientée objet ;
- programmation réseau (sockets, utilisation de TCP et UDP, utilisation de HTTP).

Les unités POO et DAI permettrent d'acquérir ces connaissances.

== Objectifs

#linebreak()

Un objectif bien rédigé est…

- Facilement observable (verbe d’action)
- Centré sur l’apprentissage de l’étudiant-e
- Clair et concis (1 seule idée)
- Relié aux contenus (réfléchir aux usages en situations de ces enseignements)
Par exemple:

- L’étudiant-e sera capable de rédiger un texte argumentatif
- L’étudiant-e sera capable de résoudre un problème de trigonométrie…

=== Connaissances/compétences:

Nommer, rappeler, réciter, reconnaître, répéter, montrer, décliner, décrire, arranger, finir, copier, identifier,
cataloguer, lister, mémoriser, expliquer, clarifier, examiner, sélectionner,..

=== Application:

Appliquer, calculer, choisir, classifier, démontrer, identifier, illustrer, interpréter, manipuler, modifier, opérer,
mettre en relation, planifier, résoudre, utiliser, écrire, rédiger, …

=== Evaluation:

Analyser, évaluer, calculer, caractériser, choisir, comparer, contraster, différencier, critiquer, mettre en relief,
déduire, examiner, expérimenter, organiser, interroger, tester, discriminer, distinguer, prouver, proposer, rédiger,
juger, composer, étudier, développer, estimer, …

Depuis sa création au début des années 90, le Web ne cesse d'évoluer. Riche en liberté et en innovation, il est devenu une plateforme de développement incontournable. Les paradigmes qui le composent ont chacun eu leur moment de gloire. De pages statiques en passant par des applications dynamique, le Web a su s'adapter aux besoins du marché. Avec l'explosion des services mobiles, des réseaux sociaux et plus récemment de l'Internet des Objets, les vagues d'innovation dans le domaine du Web se succèdent les unes aux autres. L'objectif principal de cette unité est d'étudier les grandes tendances actuelles et d'appréhender les principes, les standards, les technologies et les outils qui sont en train de s'imposer sur le marché.

A l'issue de cette unité d'enseignement, la personne qui étudie sera capable de :

Statique

- créer des pages Web (HTML, CSS, Javascript, Typescript) de manière estétique (Bootstrap, Material Design, etc.) ;
- illustrer les différentes parties qui composent le Web (CDN, DNS, etc.) ;
- proposer des manières de communiquer avec de la clientèle (Wireframe, Penpot, Figma) ;
- appliquer les bonnes pratiques du travail en équipe (Formatter, Linter, Git, etc.) ;
- proposer/comparer différentes manières de créer un site statique (Hugo, Jekyll, etc.) ;
- déployer un site statique et y attribuer un nom de domaine(GitHub Pages, GitLab CI/CD, truc de ludo pour les noms de domaine gratuits);
- créer du contenu à partir d'une API externe (Fetch) ;

Dynamique

- développer une application CRUD avec le pattern MVC en PHP ;
- expérimenter l'utilisation du routing ;
- créer des formulaires et les valider ;
- utiliser des bases de données avec PHP ;
- examiner les avantages et les inconvéniants d'utiliser des librairies externes (Composer) ;
- proposer des manières de debugger une stack PHP ;

Stack Node.js
- choisir quelle paradigme utiliser pour communiquer sur le réseau (Fetch, Server-Sent Events, Websockets, WebRTC, etc.)
- programmer des applications utilisant le réseau (Fetch, Server-Sent Events, Websockets, WebRTC, etc.) ;
- concevoir des interfaces utilisateur avec un framework réactif (React, Vue, Svelte) ;
- comprendre l’architecture REST (client-server, statelessness, cacheable, uniform interface, layered system, code on demand) ;
- écrire des tests automatisés pour des applications Node.js ;
- utiliser les notions de cookies, de session, d’authentification et d’autorisation ;
- sécuriser une applications Web (injection SQL, XSS, CSRF, etc.) ;
- compiler du code C, C++ et Rust en WebAssembly.

Cette unité est organisée avec une orientation très pratique. Les concepts présentés sont appliqués pour réaliser des applications Web de plus en plus conséquentes.

#pagebreak()

== Contenu et formes d'enseignement

#linebreak()

_Répartition des périodes indiquée à titre informatif_


#pagebreak()

== Contrôle de connaissances

#linebreak()

=== Cours

#linebreak()

l'acquisition des matières de cet enseignement sera contrôlée au fur et à mesure par des tests et des travaux personnels tout au long de son déroulement. Il y aura au moins 2 tests d'une durée totale d'au moins 3 périodes.

Matériel autorisé :

- information communiquée directement par l'enseignant.

=== Laboratoire

#linebreak()

ils seront évalués sur la base des rapports de manipulation, à 3 reprises au minimum.

=== Examen

#linebreak()

l'atteinte de l'ensemble des objectifs de formation sera vérifiée lors d'un contrôle final commun écrit d'une durée de 90 minutes.

Matériel autorisé :

- information communiquée directement par l'enseignant.

#linebreak()

== Note finale

#linebreak()

#table(
  columns: (1fr, 1fr),
  inset: 10pt,
  align: horizon,
  "Cours",
   "30%",
  "Laboratoire",
  "20%",
  "Examen",
  "50%",
)
