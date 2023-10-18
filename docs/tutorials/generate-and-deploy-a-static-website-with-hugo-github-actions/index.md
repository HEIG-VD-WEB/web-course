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

If you try to run the Hugo server, running the following command in the terminal of Visual Studio Code:

```bash
hugo server
```

You will get the following message, when you try to access the website at `http://localhost:1313`:

```bash
Page Not Found
```

Hugo is telling you that you don't have any content in your website and that you need a theme.

### Add a theme

You are going to use the [Ananke](https://themes.gohugo.io/gohugo-theme-ananke/) theme for this project.

From your project's root directory, initiate the hugo module system:

```bash
hugo mod init github.com/<your-username>/<your-repository-name>
```

!!! info
	Replace `<your-username>` and `<your-repository-name>` with your GitHub username and the name of your repository.

	Example
	
	```bash
	hugo mod init github.com/HEIG-VD-WEB/generate-and-deploy-a-static-website-with-hugo-github-actions
	```

Add the theme's repository to your project's `config.toml` file:

```toml
theme = "github.com/theNewDynamic/gohugo-theme-ananke"
```

Your `config.toml` file should look like this:

```toml
baseURL = 'https://example.org/'
languageCode = 'en-us'
title = 'My New Hugo Site'
theme = "github.com/theNewDynamic/gohugo-theme-ananke"
```

### Start the Hugo server

Run the following command in the terminal of Visual Studio Code:

```bash
hugo server
```

The output should look like this:

```bash
Watching for changes in /workspaces/<your-repository-name>/{archetypes,assets,content,data,i18n,layouts,static}
Watching for config changes in /workspaces/<your-repository-name>/hugo.toml, /workspaces/<your-repository-name>/go.mod
Start building sites … 
hugo v0.119.0-b84644c008e0dc2c4b67bd69cccf87a41a03937e linux/amd64 BuildDate=2023-09-24T15:20:17Z VendorInfo=gohugoio

                   | EN  
-------------------+-----
  Pages            |  7  
  Paginator pages  |  0  
  Non-page files   |  0  
  Static files     |  1  
  Processed images |  0  
  Aliases          |  0  
  Sitemaps         |  1  
  Cleaned          |  0  

Built in 13 ms
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1) 
Press Ctrl+C to stop
```

You can now access your website at `http://localhost:1313`. You should see a main page with a big title and a footer not at the bottom of the page.

There lacks a few things to make this website look good.

### Add content

As the Ananke theme is a blog theme, you need to add some content to your website.

Create the first post of your blog

```bash title="content/posts/my-first-post.md"
---
title: "My First Post"
date: 2021-09-24T15:20:17+02:00	
draft: false
---

This is my first post.
```

If your server is still running, you should see your post at `http://localhost:1313/`. The footer is at the bottom of the page, like it should be.

### Add a second post

You can use Hugo to create a new post:

```bash
hugo new content posts/my-second-post.md
```

As you can see, Hugo created a new post in the `content/posts` folder. That should look like this:

```bash title="content/posts/my-second-post.md"
+++
title = 'My Second Post'
date = 2023-10-12T19:37:08Z # (1)!
draft = true
+++
```
<!-- So I know the code block above is not a "bash" but "markdown". 
But I don't know how to add code annotation on markdown codeblock -->

1. The date is set to the current date. You can change it to the date you want.

Hugo used the `archetypes/default.md` file to create the new post. You can change the default content of the post by changing the content of this file.

```bash title="archetypes/default.md"
+++
title = '{{ replace .File.ContentBaseName "-" " " | title }}'
date = {{ .Date }}
draft = true
+++
```

If your server is still running, you should see qonly one post at `http://localhost:1313/`. That's because the second post is a draft. You can see it by adding the `--buildDrafts` flag to the `hugo server` command:

```bash
hugo server --buildDrafts
```

You can now see both posts at `http://localhost:1313/`.

### Add a menu

You can add a menu to your website by adding the following code to your `config.toml` file:

```toml
[menu]
	[[menu.main]]
		name = "Home"
		url = "/"
		weight = 1
	[[menu.main]]
		name = "Posts"
		url = "/posts"
		weight = 2
```

## Sources

- [Hugo - Quick Start](https://gohugo.io/getting-started/quick-start/)
- [Hugo - Host on GitHub Pages](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
- [GitHub - Ananke, A theme for Hugo](https://github.com/theNewDynamic/gohugo-theme-ananke)
