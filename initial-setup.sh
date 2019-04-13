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
rvm use 2.5.1
curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish

# homebrew install.
ruby <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
./brew.sh
./brew-cask.sh

# setup dock.
# dockutil - https://formulae.brew.sh/formula/dockutil
curl -k -o /usr/local/bin/dockutil https://raw.githubusercontent.com/kcrawford/dockutil/master/scripts/dockutil
chmod a+x /usr/local/bin/dockutil
hash -r
./dock-setup.sh

# nvm node install.
nvm install stable
nvm use stable
nvm alias default node

yarn global add diff-so-fancy
yarn global add eslint
yarn global add snyk

sudo pip install wakatime
pip3 install virtualfish

# symlink it up!
./symlink-setup.sh
./dropbox.sh
source ~/.bash_profile

# dns privacy.
# sudo brew services start stubby
sudo brew services start dnscrypt-proxy
shieldsup

# macos defaults
./macos.sh

# change to bash 4 for backup shell.
sudo bash -c 'echo $(brew --prefix)/bin/bash >> /private/etc/shells'
chsh -s $(brew --prefix)/bin/bash
shopt -s globstar

# use fish for main shell.
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
