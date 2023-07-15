# How to use pnpm

## Installation

Install [pnpm](../../explanations/about-pnpm/index.md) with the following commands.

```sh title="In a terminal, execute the following command(s)."
npm install --global pnpm
```

## Configuration

The configuration for Husky is located in the `.npmrc` and `pnpm-workspace.yaml` files. The `pnpm-lock.yaml` file is used by pnpm as a lock file for all the dependencies and their exact versions.

## Run pnpm

You can run cspell from anywhere in the project with the following command.

```sh title="In a terminal, execute the following command(s)."
pnpm --workspace-root review:spellcheck
```

## Common tasks

### Initialize a Node project

```sh title="In a terminal, execute the following command(s)."
pnpm init
```

This will generate the `package.json` file for the project.

### Add a Node project to the workspace

You can add a Node project to the pnpm workspace in the `pnpm-workspace.yaml` file.

### Run a command

Unlike `npm` and `yarn`, you can run any command with `pnpm` with the following command.

```sh title="In a terminal, execute the following command(s)."
pnpm <command>
```

The `<command>` is the command you want to run that is defined in the `scripts` key of the `package.json` file.

All commands usually available with `npm` and `yarn` are available with `pnpm`.

### Run a command for a specific project

Once the project is added to the workspace, you can run commands for a specific project with the following command.

```sh title="In a terminal, execute the following command(s)."
pnpm --filter <project-name> <command>
```

The `--filter` flag will run the command only for the project with the name `<project-name>` from any directory in the project.

The `<project-name>` is set in the `package.json` file of the Node project you just added to the workspace.

The `<command>` is the command you want to run that is defined in the `scripts` key of the `package.json` file.

### Run a command for multiple projects

You can run commands for a multiple projects with the following command.

```sh title="In a terminal, execute the following command(s)."
pnpm --filter <project-name-1> [--filter <project-name-2>] [--parallel] <command>
```

The optional `--parallel` flag will run the command in parallel for all the projects.

### Run a command for the root project

The root project is the project located at the root level of the project in the `package.json` file.

```sh title="In a terminal, execute the following command(s)."
pnpm --workspace-root <command>
```

The `<command>` is the command you want to run that is defined in the `scripts` key of the root `package.json` file.

## Related explanations

These explanations are related to the current item (in alphabetical order).

_None at the moment._

## Resources and alternatives

These resources and alternatives are related to the current item (in alphabetical order).

_None at the moment._
