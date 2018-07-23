# dotfiles

## Installation

When running on a brand new machine:

[Install dropbox](https://www.dropbox.com/install) and sync ./.ssh/config and ./.extra

[Generate an SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/) and [add it to your Github account](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

Create `~/Projects` and run the following:

```bash
git clone https://github.com/virenratan/dotfiles.git && cd dotfiles && ./initial-setup.sh
```

You'll want to set some sensible macOS defaults:

```bash
./macos.sh
```

## Updating

If you just need to update the symlinks:

```bash
git pull origin develop
./symlink-setup.sh
```

## Thanks to people I've grabbed stuff from
- [holman/dotfiles](https://github.com/holman/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [kentcdodds/dotfiles](https://github.com/kentcdodds/dotfiles)
- [github/gitignore](https://github.com/github/gitignore)
