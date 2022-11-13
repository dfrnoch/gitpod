# Gitpod workspace as an everyday workflow
Theese dotfiles are meant to make gitpod.io feel as your primary coding environment. The setup is highly opinionated and based on my own workflow and preferences.

The main features are:

- zsh with autosomplete and syntax highlighting using [starship.rs](https://starship.rs/) as the default theme
- configured gpg commit signing
- [bun](https://github.com/oven-sh/bun) preinstalled for managing node packages
- [commitizen](https://github.com/commitizen/cz-cli) for conventional commit messages
- [Fira Code](https://github.com/tonsky/FiraCode) fonts

## Prerequisites

In order to be able to sign commits, you need to set the following environment variables:

- `$GPG_KEY` - your **PRIVATE** GPG key, used for signing commits
- `$GPG_KEY_ID` - the long ID of your GPG key

## Using the dotfiles

1. Fork this repository (if you want to make changes),
2. Go to **Gitpod Settings** > [**Preferences**](https://gitpod.io/preferences) and set your forked repository as the custom dotfiles repository

That's it! Your next gitpod.io workspace will use the custom dotfiles.

## Credits
https://github.com/gitpod-io/demo-dotfiles
