#!/usr/bin/env bash

brew upgrade

# add taps.
brew tap homebrew/cask-fonts

# update system level stuff.
brew install coreutils
brew install findutils
brew install bash
brew install curl --with-nghttp2
brew link curl --force
brew install grep
brew install less
brew install wget

# install general stuff.
brew install git
brew install imagemagick
brew install librsvg
brew install mas
brew install ngrep
brew install node
brew install nvm
brew install rename
brew install stubby
brew install tree
brew install webkit2png
brew install yarn --without-node
brew install zopfli
brew install zsh
brew install zsh-completions

# tidy up.
brew cleanup
