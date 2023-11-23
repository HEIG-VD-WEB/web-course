# HEIG-VD DAI Course

The main repository for the DAI course at HEIG-VD, Switzerland.

## Website

Go to the [website](https://heig-vd-web.github.io/web-course/).

## Prerequisites

The following prerequisites must be filled to run this service:

- [Docker](https://docs.docker.com/get-docker/) must be installed.
- [Docker Compose](https://docs.docker.com/compose/install/) must be installed (it should be installed by default with Docker in most cases).
- [Visual Studio Code](https://code.visualstudio.com/download) must be installed.

## Start the application for local development

```bash
mkdocs serve
```

## Build the slides with marp

```
find . -name "presentation.md" -type f -exec sh -c 'npx @marp-team/marp-cli@latest --config marp.config.js --html --output "${1%.md}.html" "$1"' sh {} \;
```

## License

This work is licensed under a
[AGPL-3.0 license ](./LICENSE.md)
license.

Thanks for the [DAI team](https://github.com/HEIG-VD-DAI-Course), Bertil Chapuis, Olivier Lemer and Stefan Teofanovic for the collaboration
