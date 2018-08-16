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

# for the c alias (syntax highlighted cat).
sudo easy_install Pygments
sudo easy_install pip

# rvm for the rubiess.
curl -L https://get.rvm.io | bash -s stable --ruby

# homebrew install.
ruby <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
./brew.sh
./brew-cask.sh

# setup dock.
./dock-setup.sh

# nvm node install.
nvm install stable
nvm use stable
nvm alias default node

npm i -g eslint

# symlink it up!
./symlink-setup.sh
./dropbox.sh

# macos defaults
./macos.sh

# change to bash 4
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /private/etc/shells'
chsh -s $(brew --prefix)/bin/bash
shopt -s globstar

# chsh -s /bin/zsh
