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
[illustration]:
  https://images.unsplash.com/photo-1592601681044-1bfc6924c95a?q=80&w=1147&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

[problem]:
  https://images.unsplash.com/photo-1621252179027-94459d278660?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

[working]:
  https://images.unsplash.com/photo-1522125670776-3c7abb882bc2?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

[burnout]:
  https://apod.nasa.gov/apod/image/2312/art001e002132.jpg

[quiz]:
  https://images.unsplash.com/photo-1606326608690-4e0281b1e588?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

## Week 11 - Frontend & Backend

<!--
_class: lead
_paginate: false
-->
<!-- This comment will center everything on the page -->

![bg opacity:0.1][illustration]

## What is the difference between a Frontend and a Backend ?

<!--
_class: lead
-->

## A little history of the Web

<!--
_class: lead
-->

## At first, making information available

Static - Simple HTML & CSS

More Frontend

like [Astronomy Picture of the Day](https://apod.nasa.gov/apod/)

![bg right:40%][burnout]

## Things got complicated

We wanted to manipulate information.

Dynamic - PHP

More Backend

![bg right][problem]

## And the mobile phone got smart

The needed to optimize the information.

Frontend: Vue, React, Angular
Backend: Node.js, Fastify, Nest.js

![bg right][working]

## And now, the Frontend got smart

With year, technologies evolved and the frontend got smarter.

No need for a backend anymore ?

Frontend: Nuxt, Next.js, SvelteKit (Svelte + Vite)

## Where to begin ?
