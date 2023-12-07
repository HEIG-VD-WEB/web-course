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
  https://images.unsplash.com/photo-1618609255761-6392d4383957?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bm9kZXxlbnwwfHwwfHx8MA%3D%3D
[question]:
	https://images.unsplash.com/photo-1484069560501-87d72b0c3669?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D

## Node.js

<!--
_class: lead
_paginate: false
-->
<!-- This comment will center everything on the page -->

![bg opacity:0.1][illustration]


### Until now, where does the JavaScript code run?

![bg opacity:0.1][question]

### Until now, where does the JavaScript code run?

- In the browser

Wouldn't it be cool to run JavaScript on the server?

![bg opacity:0.1][question]

### What is Node.js?

- Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.

The user send a request to the server, the server send back a response.

### Alternatives to Node.js

- PHP
- ASP.NET Core
- Ruby
- Deno
- ...

### Why Node.js?

- Easy to learn
- Big community

### First move

```bash
node --version
```

index.js:
```js title="index.js"
console.log("Hello World!");
```

```bash
node index.js
```

Hello World!

### Event loop

```js title="index.js"
process.on("exit", () => {
	console.log("Goodbye!");
});

console.log("Hello World!");
```

### callback

```js title="index.js"
process.on("exit", () => {
	console.log("Goodbye!");
});

console.log("Hello World!");
```

Hello World!
Goodbye!

### Event emitter

```js title="index.js"
const EventEmitter = require("events");
const eventEmitter = new EventEmitter();

eventEmitter.on("start", () => {
	console.log("Started!");
});

eventEmitter.on("end", () => {
	console.log("Ended!");
});

eventEmitter.emit("start");
eventEmitter.emit("end");
eventEmitter.emit("start");
```

### Event emitter

Started!
Ended!
Started!

---

text.txt:
```
Hello World! I am a text file.
```

```js title="index.js"
const { readFile } = require("fs");

readFile("./text.txt", "utf8", (err, data) => {
	if (err) {
		console.error(err);
		return;
	}
	console.log(data);
});

console.log("Am I the second message ?");
```

### File system

Am I the second message ?
Hello World! I am a text file.

### Module

```js title="index.js"
const { readFile } = require("fs");
```

### Create your own module

```js title="math.js"
const add = (x, y) => {
	return x + y;
};

const PI = 3.14159;

module.exports = {
	add: add,
	PI: PI,
};
```

```js title="index.js"
const math = require("./math.js");
```

### NPM

- Node Package Manager

### NPM

```bash
npm init --yes
```

```bash
.
├── index.js
└── package.json
```

---


```json
{
	"name": "nodejs",
	"version": "1.0.0",
	"description": "Node.js course",
	"main": "index.js",
	"scripts": {
		"start": "node index.js"
	},
	"keywords": [
		"nodejs"
	],
	"author": "Vincent Guidoux",
	"license": "MIT"
}
```

### Install first package

```bash
npm install express
```

---

```json
{
	"name": "nodejs",
	"version": "1.0.0",
	"description": "Node.js course",
	"main": "index.js",
	"scripts": {
		"start": "node index.js"
	},
	"keywords": [
		"nodejs"
	],
	"author": "Vincent Guidoux",
	"license": "MIT",
	"dependencies": {
		"express": "^4.17.1"
	}
}
```

### Install dev dependencies

nodemon is a tool that helps develop Node.js based applications by automatically restarting the node application when file changes in the directory are detected.

```bash
npm install --save-dev nodemon
```

---

```json
{
	"name": "nodejs",
	"version": "1.0.0",
	"description": "Node.js course",
	"main": "index.js",
	"scripts": {
		"start": "node index.js",
		"dev": "npx nodemon index.js 3000"
	},
	"keywords": [
		"nodejs"
	],
	"author": "Vincent Guidoux",
	"license": "MIT",
	"dependencies": {
		"express": "^4.17.1"
	},
	"devDependencies": {
		"nodemon": "^2.0.15"
	}
}
```

### Create a simple web server

```js title="index.js"
const express = require('express');
const { readFile } = require('fs');

const app = express();

app.get('/', (req, res) => {
  readFile('./home.html', 'utf8', (err, html) => {
    if (err) {
      res.status(500).send('sorry, out of order');
    }
    res.send(html);
  })
});

app.listen(process.env.PORT || 3000, () => console.log('App available on http://localhost:3000'));
```

### Dockerize

```dockerfile
FROM node:20-alpine as build
WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci --omit=dev

COPY home.html home.html
COPY index.js index.js

EXPOSE 3000

CMD ["npm", "run", "start"]
```

