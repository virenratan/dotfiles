# dotfiles

## Installation

When running on a brand new machine:

```bash
git clone https://github.com/virenratan/dotfiles.git && cd dotfiles && ./initial-setup.sh
```

You might also want to set some sensible macOS defaults:

```
$ ./macos.sh
```

If you just need to update the symlinks:

```
$ ./symlink-setup.sh
```

## Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` file is symlinked from Dropbox so it stays up to date across machines but never touches the repository:

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/virenratan/dotfiles/fork) instead, though.

## Thanks to people I've grabbed stuff from
- [holman/dotfiles](https://github.com/holman/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [kentcdodds/dotfiles](https://github.com/kentcdodds/dotfiles)
- [github/gitignore](https://github.com/github/gitignore)
