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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi;
brew update
brew bundle

dark-mode on

yarn global add all-the-package-names diff-so-fancy eslint fkill-cli snyk vtop

# python3 stuff.
pip3 install --upgrade pip
pip3 install --upgrade setuptools

pip3 install --upgrade flexget
pip3 install --upgrade transmissionrpc
pip3 install --upgrade virtualfish
pip3 install --upgrade wakatime

# pyenv install 3.7.4

# rbenv ruby install.
rbenv install 3.2.2
rbenv global 3.2.2

# symlink it up!
./symlink-setup.sh
source ~/.bash_profile

# switch to bash 4 for backup shell.
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /private/etc/shells'
chsh -s $(brew --prefix)/bin/bash
shopt -s globstar

# tmux setup.
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim.
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# use fish for main shell.
echo $(brew --prefix)/bin/fish | sudo tee -a /etc/shells
curl -sS https://starship.rs/install.sh | sh
chsh -s $(brew --prefix)/bin/fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# nvm install --lts


# dns privacy.
# sudo brew services start stubby
sudo brew services start dnscrypt-proxy
# shieldsup

# nvm node install. -- not working

# macos defaults
./macos.sh

# setup dock.
# ./dock-setup.sh
