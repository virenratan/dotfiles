#!/usr/bin/env bash

# update.
brew update
brew upgrade

# update system level stuff.
brew install coreutils
brew install findutils
brew install bash
brew install wget --enable-iri
brew install homebrew/dupes/grep
brew install brew-cask

# install general stuff.
brew install ack
brew install git
brew install imagemagick
brew install librsvg
brew install lynx
brew install ngrep
brew install node
brew install nvm
brew install pigz
brew install rename
brew install rhino
brew install tree
brew install webkit2png
brew install yarn --without-node
brew install zopfli
brew install zsh
brew install zsh-completions

# tidy up.
brew cleanup
