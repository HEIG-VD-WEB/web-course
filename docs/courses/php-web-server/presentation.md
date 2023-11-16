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
[docker]: 
	https://images.unsplash.com/photo-1605745341112-85968b19335b?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D
[live]:
  https://ritwickdey.gallerycdn.vsassets.io/extensions/ritwickdey/liveserver/5.7.9/1661914858952/Microsoft.VisualStudio.Services.Icons.Default
[warning]:
  https://images.unsplash.com/photo-1627024165011-6a9e2c4ea343?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D
[illustration]:
  https://images.unsplash.com/photo-1571786256017-aee7a0c009b6?q=80&w=1160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

## Web server and PHP

<!--
_class: lead
_paginate: false
-->
<!-- This comment will center everything on the page -->

![bg opacity:0.2][illustration]

## What methods did we used to run web pages on our browser ?

- Simply open a file on the browser
- Github pages
- Built-in web server in PHP  
	`php -S localhost:8080`

## Live server

Launch a local development server with live reload feature for static & dynamic pages.

[Live server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)

![bg right][live]

## What is a web server ?

A web server is a computer that have:

- a software that can answer to HTTP requests (HTTP server) and ;
- files to be displayed.

## Problems with the built-in web server ?

- Only for development
- Too much logs
- No security
- Bad efficiency

![bg right][warning]

## What are the alternative ?

- Apache
	- LAMP (Linux, Apache, MySQL, PHP)
	- XAMP (MySQL+PHP+PHPMyAdmin)
- Nginx

## Is it easy to use ?

You can install XAMPP! on your computer, but if you work with a team or lose your computer you have to install all of it.

What can be the solution ?

![bg right][docker]

---

<!--
_class: lead
-->

> La containerisation c'est bien.

_Vincent Guidoux, everyday._

## Xampp container

```bash
docker run --name myXampp -p 41061:22 -p 41062:80 -d -v /www:/www tomsik68/xampp:8
```

## Xampp container

```yaml
services:
  myXampp:
    image: tomsik68/xampp:8
    container_name: myXampp
    ports:
      - 41061:22
      - 41062:80
    volumes:
      - ./www:/www
```

## What should I remember?

- What is a web server
- Why I should not use the built-in web server in PHP

## Can I still use the built-in web server in PHP ?

Yes, but only for development.

And yes, you can use it for the practical work 2, just be sure to document it in the README.md.

## Sources

- [What is a web server ?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Web_mechanics/What_is_a_web_server)
- [PHP - built-in web server](https://www.php.net/manual/en/features.commandline.webserver.php)
- [Docker hub - tomsik68/xampp](https://hub.docker.com/r/tomsik68/xampp)
<!-- 
## This is some code

```bash
php -S localhost:8080
```

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
