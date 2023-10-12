# Generate and Deploy a Static Website with Hugo + GitHub Actions[NOT FINISHED]

## Objectives

## Prerequisites

The following prerequisites must be filled to run this service:

- [Docker](https://docs.docker.com/get-docker/) must be installed.
- [Docker Compose](https://docs.docker.com/compose/install/) must be installed (it should be installed by default with Docker in most cases).
- [Visual Studio Code](https://code.visualstudio.com/download) must be installed.
- [Dev containers](https://code.visualstudio.com/docs/remote/containers) must be installed in Visual Studio Code.

## Steps

### Initiate the project

- Create a new repository on GitHub.
- Clone the repository on your computer.
- Open the repository in Visual Studio Code.

### Initiate the dev container

- Add devcontainer configuration files by clicking on the bottom left corner of Visual Studio Code and selecting "Remote-Containers: Add Development Container Configuration Files...".
- Select "Go" in the list of available containers.
- Select the latest version of Go (1.21 at the time of this commit) in the list of available versions.
- Select "Hugo" in the list of available features.
- Select "Keep Defaults" in the next prompt.
- Add Visual Studio Code Extensions to the `devcontainer.json` by clicking on the extensions tab on the left.
	- Search for "GitHub Actions", click on the gear icon (⚙️) and select "Add to devcontainer.json".
	- Search for "`tamasfe.even-better-toml`", click on the gear icon (⚙️) and select "Add to devcontainer.json".
	- Search for "`davidanson.vscode-markdownlint`", click on the gear icon (⚙️) and select "Add to devcontainer.json".
	- (Optional) Search for "GitHub Copilot", click on the gear icon (⚙️) and select "Add to devcontainer.json".
- Remove unnecessary comments from the `devcontainer.json` file.

Your `devcontainer.json` file should look like this:

```json
{
	"name": "Go",
	// Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
	"image": "mcr.microsoft.com/devcontainers/go:1-1.21-bullseye",
	"features": {
		"ghcr.io/devcontainers/features/hugo:1": {}
	},
	"customizations": {
		"vscode": {
			"extensions": [
				"GitHub.copilot",
				"GitHub.vscode-github-actions",
				"tamasfe.even-better-toml",
				"DavidAnson.vscode-markdownlint"
			]
		}
	}
}
```

Add this attribute at the end of the `devcontainer.json` file so you can use Git in the container:

```json hl_lines="18-20"
{
	"name": "Go",
	// Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
	"image": "mcr.microsoft.com/devcontainers/go:1-1.21-bullseye",
	"features": {
		"ghcr.io/devcontainers/features/hugo:1": {}
	},
	"customizations": {
		"vscode": {
			"extensions": [
				"GitHub.copilot",
				"GitHub.vscode-github-actions",
				"tamasfe.even-better-toml",
				"DavidAnson.vscode-markdownlint"
			]
		}
	},
	"mounts": [
		"source=${localWorkspaceFolder},target=/workspace,type=bind,consistency=cached"
	]
}
```

- Open the command palette in Visual Studio Code by pressing `Ctrl+Shift+P` or `Cmd+Shift+P`.
- Select "Remote-Containers: Reopen in Container".

Your folder should look like that:

```bash
.
├── .devcontainer
│   └── devcontainer.json
```

### Initiate the Hugo project

Create a new Hugo project by running the following command in the terminal of Visual Studio Code:

```bash
hugo new site . --force
```

Your root folder should look like that:

```bash
.
├── .devcontainer
├── archetypes
├── assets
├── content
├── data
├── i18n
├── layouts
├── static
├── themes
├── hugo.toml
└── README.md
```

## Sources

- [Hugo - Quick Start](https://gohugo.io/getting-started/quick-start/)
- [Hugo - Host on GitHub Pages](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
- [GitHub - Ananke, A theme for Hugo](https://github.com/theNewDynamic/gohugo-theme-ananke)
