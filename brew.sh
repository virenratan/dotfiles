#!/usr/bin/env bash

brew upgrade

# add taps.
brew tap homebrew/cask-fonts
brew tap caskroom/fonts
brew tap domt4/autoupdate

# update system level stuff.
brew install autojump
brew install bash
brew install coreutils
brew install curl --with-nghttp2
brew link curl --force
brew install diff-so-fancy
brew install findutils
brew install fish
brew install git
brew install grep
brew install htop
brew install less
brew install ngrep
brew install nmap
brew install node
brew install tree
brew install wget

# install general apps and stuff.
brew install dnscrypt-proxy
brew install git-quick-stats
brew install git-secrets
brew install gnupg
brew install imagemagick
brew install librsvg
brew install mas
brew install nvm
brew install smimesign
brew install stubby
brew install terminal-notifier
brew install watchman
brew install webkit2png
brew install wifi-password
brew install yarn --without-node

# tidy up.
brew cleanup
