# dotfiles

> Personal configurations for macOS, fish, iTerm2 and more.
> Includes `.macos` — sensible defaults for macOS.

## 👋 Getting started

When running on a fresh machine:

- Sign into iCloud
- Install Homebrew:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install Google Chrome and 1Password:

```shell
brew install google-chrome 1password
```

- Enable the SSH Agent in 1Password and ensure the "Generate SSH config file with bookmarked hosts" is enabled. The rest of the ssh config should sync from iCloud or be symlinked by this repo.
- Create a `~/Projects` directory

```shell
mkdir Projects && cd Projects
```

- Run the following:

```shell
git clone git@github.com:virenratan/dotfiles.git && cd dotfiles && ./initial-setup.sh
```

### Copilot

Install the GitHub CLI and then the Copilot extension:

```shell
gh extension install github/gh-copilot
```

### GPG setup

- [Signing your Git Commits using GPG on MacOS Sierra/High Sierra](https://gist.github.com/virenratan/914bfdd76ac0561574ed918da2bce78e)

## ⬆️ Updating

If you just need to update the symlinks:

```shell
git pull origin develop
./symlink-setup.sh
```

## 🙏 Thanks to people I've grabbed stuff from

- [holman/dotfiles](https://github.com/holman/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [kentcdodds/dotfiles](https://github.com/kentcdodds/dotfiles)
- [github/gitignore](https://github.com/github/gitignore)
