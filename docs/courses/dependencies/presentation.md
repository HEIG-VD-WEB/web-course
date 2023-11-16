---
marp: true
---

<!--
theme: gaia
size: 16:9
paginate: true
author: V. Guidoux, with the help of ChatGPT, L. Delafontaine and H. Louis.
title: HEIG-VD WEB Course - PHP
description: PHP course for the WEB course at HEIG-VD, Switzerland
url: https://github.com/HEIG-VD-WEB/web-course/tree/main/docs/courses
footer: '**HEIG-VD** - WEB Course 2023-2024 - AGPL-3.0 license'
style: |
    :root {
        --color-background: #fff;
        --color-foreground: #333;
        --color-highlight: #f96;
        --color-dimmed: #888;
        --color-headings: #7d8ca3;
    }
    blockquote {
        font-style: italic;
    }
    table {
        width: 100%;
    }
    th:first-child {
        width: 15%;
    }
    h1, h2, h3, h4, h5, h6 {
        color: var(--color-headings);
    }
    h2, h3, h4, h5, h6 {
        font-size: 1.5rem;
    }
    h1 a:link, h2 a:link, h3 a:link, h4 a:link, h5 a:link, h6 a:link {
        text-decoration: none;
    }
    section:not([class=lead]) > p, blockquote {
        text-align: justify;
    }
headingDivider: 4
-->

<!-- This is a way to make link and shortcut in the code -->
[dealer]:
  https://images.unsplash.com/photo-1618304925090-b68a8c744cbe?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D
[next]:
  https://images.unsplash.com/photo-1529448005898-b19fc13465b7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmV4dHxlbnwwfHwwfHx8MA%3D%3D
[problem]:
  https://images.unsplash.com/photo-1621252179027-94459d278660?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D
[dependencies]:
  https://plus.unsplash.com/premium_photo-1663040178972-ee1d45d33899?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGRlcGVuZGVuY2llc3xlbnwwfHwwfHx8MA%3D%3D
[stick]:
  https://images.unsplash.com/photo-1477071135119-a6b75c21aebc?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

## When you need some code

<!--
_class: lead
_paginate: false
-->
<!-- This comment will center everything on the page -->

![bg opacity:0.1][dependencies]

## Do we need to code everything from scratch ?

<!--
_class: lead
_paginate: false
-->

## Library

- Close or Open source (Am I alowed to use it ?)
- Free or not (Can I afford it ?)
- Documentation (Is it well documented ?)
- Community (Is there a community ?)

[xeokit](https://xeokit.io/)  
[paper.js](http://paperjs.org/)

![bg right:30%][stick]

## HTML & JavaScript

[NPM - Node Package Manager](https://www.npmjs.com/)

```html
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
```

[A simple dependency example](https://github.com/HEIG-VD-WEB/simple-dependency-example)

## Problems

- Versioning
- Compatibility
- Security
- What if a library need a library ?

![bg left:40%][problem]

## Dependency/package/library Manager

- NPM (NodeJS)
- Composer (PHP)
- Bundler (Ruby)
- Pip (Python)
- Maven (Java)
- NuGet (.NET)

![bg right][dealer]

## Problems

At first, only one library manager per language existed, and some other appeared later.

Like PNPM for NPM.

The versionning between versions of the same library manager is not always compatible.

## What should I remember ?

- What a dependency is, what are the advantages and disadvantages about it and when and why we need/use it.
- What a package manager is, what are the advantages and disadvantages about it and when and why we need/use it.

Transition !

![bg right:30%][next]

## Sources

- [unsplash](https://unsplash.com/)

<!-- 

## This is a quote

> This is a quote

## This is an image to the right

![bg right][illustration]

## This is an image to the left

![bg left][illustration]

## This is a full image on the right

![bg right contain][illustration]

## This is an image on the right, but only 30%

![bg right:30%][illustration] -->
