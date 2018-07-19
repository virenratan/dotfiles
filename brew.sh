#!/usr/bin/env bash

# update.
brew update
brew upgrade

# add repositories.
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap phinze/homebrew-cask

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
brew install lua52
brew install lynx
brew install ngrep
brew install node
brew install pigz
brew install rename
brew install rhino
brew install tree
brew install webkit2png
brew install yarn
brew install zopfli
brew install zsh

# tidy up.
brew cleanup