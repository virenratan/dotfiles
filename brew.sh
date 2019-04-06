#!/usr/bin/env bash

brew upgrade

# add taps.
brew tap homebrew/cask-fonts
brew tap caskroom/fonts

# update system level stuff.
brew install autojump
brew install bash
brew install coreutils
brew install curl --with-nghttp2
brew link curl --force
brew install diff-so-fancy
brew install findutils
brew install fish
brew install grep
brew install less
brew install wget

# install general stuff.
brew install dnscrypt-proxy
brew install git
brew install git-quick-stats
brew install git-secrets
brew install gnupg
brew install imagemagick
brew install librsvg
brew install mas
brew install ngrep
brew install node
brew install nvm
brew install rename
brew install smimesign
brew install stubby
brew install terminal-notifier
brew install tree
brew install watchman
brew install webkit2png
brew install yarn --without-node
brew install zopfli

# tidy up.
brew cleanup
