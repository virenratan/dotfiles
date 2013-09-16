# humanPincushion's dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The sync script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/humanPincushion/dotfiles.git && cd dotfiles && source sync.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source sync.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source sync.sh
```

There is a shorter alias for this too:

```bash
dfbs
```


### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/humanPincushion/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,sync.sh,license}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/humanPincushion/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` file is symlinked from Dropbox so it stays up to date across machines but never touches the repository:

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/humanPincushion/dotfiles/fork) instead, though.

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```bash
./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./.brew
```
### Thanks to people I've grabbed stuff from
- [holman](https://github.com/holman/dotfiles/)
- [paulirish](https://github.com/paulirish/dotfiles/)
- [mathiasbynens](https://github.com/mathiasbynens/dotfiles/)
- [OS X hidden preferences](http://lri.me/osx.html#hidden-preferences)
- [ptb OX S Lion setup](https://github.com/ptb/Mac-OS-X-Lion-Setup/blob/master/setup.sh)
- [gitignore](https://github.com/github/gitignore)