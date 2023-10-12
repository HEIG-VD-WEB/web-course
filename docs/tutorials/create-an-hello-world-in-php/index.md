# Create a Hello World in PHP

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

### Create the index.php file

- Create a new file named `index.php` in the root of your project.
- Add the following code in the file:

```php
<?php echo 'Hello World'; ?>
```

Your folder should look like that:

```bash
.
├── .devcontainer
│   └── devcontainer.json
│   index.php
```

### Run the project

- Open the command palette in Visual Studio Code by pressing `Ctrl+Shift+P` or `Cmd+Shift+P`.
- Select "Remote-Containers: Reopen in Container".
- Open the terminal in Visual Studio Code.
- Run the following command to start the server:

```bash
php -S localhost:8080
```



