# dotfiles

## Installation

```
$ git clone https://github.com/virenratan/dotfiles.git && cd dotfiles && ./initial-setup.sh
```

To update your dotfiles after making or pulling changes via git, `cd` into your local repository and then:

```
$ ./symlink-setup.sh
```

## Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible MacOS defaults:

```
$ ./macos.sh
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` file is symlinked from Dropbox so it stays up to date across machines but never touches the repository:

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/virenratan/dotfiles/fork) instead, though.

## Thanks to people I've grabbed stuff from
- [holman/dotfiles](https://github.com/holman/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [kentcdodds/dotfiles](https://github.com/kentcdodds/dotfiles)
- [OS X hidden preferences](http://lri.me/osx.html#hidden-preferences)
- [ptb: OS X Lion setup](https://github.com/ptb/Mac-OS-X-Lion-Setup/blob/master/setup.sh)
- [github/gitignore](https://github.com/github/gitignore)
