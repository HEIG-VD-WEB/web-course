# Create a To Do list in PHP [NOT FINISHED]

## Prerequisites

The following prerequisites must be filled to run this service:

- [Docker](https://docs.docker.com/get-docker/) must be installed.
- [Docker Compose](https://docs.docker.com/compose/install/) must be installed (it should be installed by default with Docker in most cases).
- [Visual Studio Code](https://code.visualstudio.com/download) must be installed.
- [Dev containers](https://code.visualstudio.com/docs/remote/containers) must be installed in Visual Studio Code.

## Steps

### Create the project

- Create a new folder for your project and open it in Visual Studio Code.
- Add devcontainer configuration files by clicking on the bottom left corner of Visual Studio Code and selecting "Remote-Containers: Add Development Container Configuration Files...".
- Select "PHP" in the list of available containers.
- Select the latest version of PHP (8.2 at the time of this commit) in the list of available versions.

Your folder should look like that:

```bash
.
├── .devcontainer
│   └── devcontainer.json
```
