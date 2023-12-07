# Create a simple full stack with JavaScript

## Objectives

With this tutorial, you will create a simple full stack with JavaScript.

## Prerequisites

The following prerequisites must be filled to run this service:

- [Docker](https://docs.docker.com/get-docker/) must be installed.
- [Docker Compose](https://docs.docker.com/compose/install/) must be installed (it should be installed by default with Docker in most cases).
- [Visual Studio Code](https://code.visualstudio.com/download) must be installed.
- [Dev containers](https://code.visualstudio.com/docs/remote/containers) must be installed in Visual Studio Code.

## Steps

### Initiate the dev container

- Add devcontainer configuration files by clicking on the bottom left corner of Visual Studio Code and selecting "Remote-Containers: Add Development Container Configuration Files...".
- Select "Node" in the list of available containers.
- Select the latest version of Node (18 at the time of this commit) in the list of available versions.
- Select additional features to install:
	- Docker (Docker-in-Docker)
- Click on "OK"
- Select the "Keep Default" option.
- Add Visual Studio Code Extensions to the `devcontainer.json` by clicking on the extensions tab on the left.
	- Search for "JavaScript (ES6) code snippets", click on the gear icon (⚙️) and select "Add to devcontainer.json"
	- (Optional) Search for "GitHub Copilot", click on the gear icon (⚙️) and select "Add to devcontainer.json".
- Remove unnecessary comments from the `devcontainer.json` file.

Your `devcontainer.json` file should look like that:

```json title=".devcontainer/devcontainer.json" hl_lines="7 12-15"
{
	"name": "Untitled Node.js project",
	"build": {
		"dockerfile": "Dockerfile"
// See https://containers.dev/implementors/json_reference/ for configuration reference
	},
	"runArgs": ["-p=3000:3000"],
	"remoteUser": "node",
	"features": {
		"ghcr.io/devcontainers/features/docker-in-docker:2": {},
	},
  // Map the user's SSH directory to the container for SSH signing
  "mounts": [
    "type=bind,source=${localEnv:HOME}/.ssh,target=${localEnv:HOME}/.ssh,type=bind,consistency=cached"
  ]
}
```

The highlighted parameters are for a late operation in this tutorial.

Your folder should look like that:

```bash
.
├── .devcontainer
│   ├── devcontainer.json
│   └── Dockerfile
```

### Test the development environment

Open the devcontainer by clicking on the bottom left corner of Visual Studio Code and selecting "Remote-Containers: Reopen in Container".

Open a terminal in Visual Studio Code and run the following command:

```bash
node --version
```

You should see the version of Node installed in the container. And it should be 18 or higher.

### Create your first Node.js application

Create a new file named `index.js` and add the following code:

```js title="index.js"
console.log("Hello World!");
```

Open a terminal in Visual Studio Code and run the following command:

```bash
node index.js
```

You should see the following output:

```bash
Hello World!
```

### Get around the event loop

Modify the `index.js` file to add the following code:

```js title="index.js"
process.on("exit", () => {
	console.log("Goodbye!");
});

console.log("Hello World!");
```

Open a terminal in Visual Studio Code and run the following command:

```bash
node index.js
```

You should see the following output:

```bash
Hello World!
Goodbye!
```

As you can see, the `process.on("exit")` callback is called after the `console.log("Hello World!")` statement.

### Know about the eventEmitter

Modify the `index.js` file to add the following code:

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

Open a terminal in Visual Studio Code and run the following command:

```bash
node index.js
```

You should see the following output:

```bash
Started!
Ended!
Started!
```

As you can see, the `eventEmitter.on("start")` callback is called twice, but the `eventEmitter.on("end")` callback is called only once.

### Is there a file system ?

Create a new file named `text.txt` and add the following text:

```txt title="text.txt"
Hello World! I am a text file.
```

Modify the `index.js` file to add the following code:

```js title="index.js"
const { readFile, readFileSync } = require("fs");

readFile("./text.txt", "utf8", (err, data) => {
	if (err) {
		console.error(err);
		return;
	}
	console.log(data);
});

console.log("Am I the second message ?");
```

Open a terminal in Visual Studio Code and run the following command:

```bash
node index.js
```

You should see the following output:

```bash
Am I the second message ?
Hello World! I am a text file.
```

As you can see, the `console.log("Am I the second message ?")` statement is called before the `readFile("./text.txt")` callback.

### Modules

Create a new file named `math.js` and add the following code:

```js title="math.js"
const add = (x, y) => {
	return x + y;
};

const PI = 3.14159;

const square = (x) => {
	return x * x;
};

module.exports = {
	add: add,
	PI: PI,
	square: square,
};
```

Modify the `index.js` file to add the following code:

```js title="index.js"
const math = require('./math.js');

console.log(math.add(1, 2));
console.log(math.PI);
console.log(math.square(3));
```

Open a terminal in Visual Studio Code and run the following command:

```bash
node index.js
```

You should see the following output:

```bash
3
3.14159
9
```

### initiate NPM

Open a terminal in Visual Studio Code and run the following command:

```bash
npm init --yes
```

Your folder should look like that:

```bash
.
├── .devcontainer
│   ├── devcontainer.json
│   └── Dockerfile
├── index.js
├── math.js
└── package.json
```

Open the terminal in Visual Studio Code and run the following command:

```bash
npm run test
```

You should see the following output:

```bash
> <your-project-name>@1.0.0 test
> echo "Error: no test specified" && exit 1

Error: no test specified
```

Wow, you can run a script without writing it !

### Install a package

Open a terminal in Visual Studio Code and run the following command:

```bash
npm install express
```

Your folder should look like that:

```bash
.
├── .devcontainer
│   ├── devcontainer.json
│   └── Dockerfile
├── index.js
├── math.js
├── node_modules
│   └── ...
├── package-lock.json
└── package.json
``` 

### Use a package

Modify the `index.js` file to add the following code:

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

Create a new file named `home.html` and add the following code:

```html title="home.html"
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>I know how to use NPM and Node.js</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>
  <body>
    <h1>Hello, world!</h1>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  </body>
</html>
```

Modify the `package.json` file to add the following code:

```json title="package.json" hl_lines="7 13-15"
{
  "name": "nodejs",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.18.2"
  }
}
```

Open a terminal in Visual Studio Code and run the following command:

```bash
npm run start
```

Open your browser and go to [http://localhost:3000](http://localhost:3000){:target="_blank"}. You should see the Hello world page.

### Create a Dockerfile

Create a new file named `Dockerfile` and add the following code:

```Dockerfile title="Dockerfile"
## First stage: Build the application
FROM node:20-alpine as build

# Work directory
WORKDIR /app

# Copy package files
COPY package.json package.json
COPY package-lock.json package-lock.json

# Install dependencies
RUN npm ci

# Copy source files
COPY home.html home.html
COPY index.js index.js

EXPOSE 3000

# Run the application
CMD ["npm", "run", "start"]
```

Run the following command to build the image:

```bash
docker build -t nodejs .
```

Run the following command to run the container:

```bash
docker run -p 3000:3000 nodejs
```

Open your browser and go to [http://localhost:3000](http://localhost:3000){:target="_blank"}. You should see the Hello world page.
