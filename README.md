# humanPincushion's dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/Projects/dotfiles`, with `~/dotfiles` as a symlink.) The sync script will pull in the latest version and copy the files to your home folder.

```
$ git clone https://github.com/humanPincushion/dotfiles.git && cd dotfiles && source sync.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```
$ source sync.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```
$ set -- -f; source sync.sh
```

There is a shorter alias for this too:

```
$dfbs
```


### Git-free install

To install these dotfiles without Git:

```
$ cd; curl -#L https://github.com/humanPincushion/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,sync.sh,license}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/humanPincushion/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```
$export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` file is symlinked from Dropbox so it stays up to date across machines but never touches the repository:

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/humanPincushion/dotfiles/fork) instead, though.

### Sensible OS X defaults

When setting up a new Mac, you may want to set some sensible OS X defaults:

```
$ ./.osx
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```
$ ./.brew
```

### Is everything shitfucked?

If you've upgraded OS X recently, make sure you've upgraded and run Xcode to accept the licence agreement. Also, install the command line tools, which you can trigger using:

```
$ xcode-select --install
```

### Thanks to people I've grabbed stuff from
- [holman/dotfiles](https://github.com/holman/dotfiles/)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles/)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles/)
- [OS X hidden preferences](http://lri.me/osx.html#hidden-preferences)
- [ptb: OS X Lion setup](https://github.com/ptb/Mac-OS-X-Lion-Setup/blob/master/setup.sh)
- [github/gitignore](https://github.com/github/gitignore)