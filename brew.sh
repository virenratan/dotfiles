#!/usr/bin/env bash

# update.
brew update
brew upgrade

# update system level stuff.
brew install coreutils
brew install findutils
brew install bash
brew install wget --enable-iri
brew install grep
brew install less
brew install brew-cask
brew install curl --with-nghttp2
brew link curl --force

# install general stuff.
brew install ack
brew install git
brew install imagemagick
brew install librsvg
brew install lynx
brew install mas
brew install ngrep
brew install node
brew install nvm
brew install pigz
brew install rename
brew install rhino
brew install stubby
brew install tree
brew install webkit2png
brew install yarn --without-node
brew install zopfli
brew install zsh
brew install zsh-completions

# tidy up.
brew cleanup
