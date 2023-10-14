# dotfiles

## Installation

When running on a brand new machine:

- Sign into iCloud
- Install Homebrew:
```shell
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
- Install Google Chrome and 1Password:
```shell
brew install google-chrome 1password
```
- Enable SSH key from 1Password
- Create a `~/Projects` directory and run the following:
```shell
git clone git@github.com:virenratan/dotfiles.git && cd dotfiles && ./initial-setup.sh
```

## GPG setup

- [Signing your Git Commits using GPG on MacOS Sierra/High Sierra](https://gist.github.com/virenratan/914bfdd76ac0561574ed918da2bce78e)

## Updating

If you just need to update the symlinks:

```shell
git pull origin develop
./symlink-setup.sh
```

## Thanks to people I've grabbed stuff from
- [holman/dotfiles](https://github.com/holman/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [kentcdodds/dotfiles](https://github.com/kentcdodds/dotfiles)
- [github/gitignore](https://github.com/github/gitignore)
