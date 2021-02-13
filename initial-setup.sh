#!/usr/bin/env bash

### xcode command line tools.
# https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh
if ! xcode-select --print-path &> /dev/null; then
  # prompt user to install the xcode command line tools.
  xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # wait until the xcode command line tools are installed.
  until xcode-select --print-path &> /dev/null; do
      sleep 5
  done

  print_result $? 'Install XCode Command Line Tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # point the `xcode-select` developer directory to the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  print_result $? 'Make "xcode-select" developer directory point to Xcode'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'
fi
### end of xcode.

# homebrew install.
if ! which brew > /dev/null; then
  ruby <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
fi;
brew update
brew bundle

dark-mode on

# setup dock.
./dock-setup.sh

# nvm node install.
nvm install stable
nvm use stable
nvm alias default node

yarn global add all-the-package-names diff-so-fancy eslint fkill-cli snyk vtop

# python3 stuff.
pip install --upgrade pip
pip install --upgrade setuptools

pip3 install --upgrade pip
pip3 install --upgrade setuptools

pip3 install --upgrade flexget
pip3 install --upgrade transmissionrpc
pip3 install --upgrade virtualfish
pip3 install --upgrade wakatime

# pyenv install 3.7.4

# rbenv ruby install.
rbenv install 2.5.1
rbenv global 2.5.1

# symlink it up!
./symlink-setup.sh
source ~/.bash_profile

# dns privacy.
# sudo brew services start stubby
sudo brew services start dnscrypt-proxy
shieldsup

# macos defaults
./macos.sh

# switch to bash 4 for backup shell.
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /private/etc/shells'
chsh -s $(brew --prefix)/bin/bash
shopt -s globstar

# tmux setup.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim.
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# use fish for main shell.
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
