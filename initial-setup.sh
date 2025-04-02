#!/usr/bin/env bash

# homebrew install.
if ! which brew > /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi;
brew update
brew bundle

# symlink it up!
./symlink-setup.sh

# Set up Git config to include shared config
if [ -f ~/.gitconfig ]; then
  # Check if include directive already exists
  if ! grep -q "path = ~/.gitconfig.shared" ~/.gitconfig; then
    # Create temporary file with include directive at the top
    echo -e "# Include shared configuration (can be overridden by settings below)\n[include]\n  path = ~/.gitconfig.shared\n\n$(cat ~/.gitconfig)" > ~/.gitconfig.temp
    mv ~/.gitconfig.temp ~/.gitconfig
    echo "Added shared config include to existing .gitconfig"
  fi
else
  # Create new .gitconfig with include directive
  echo -e "# Include shared configuration (can be overridden by settings below)\n[include]\n  path = ~/.gitconfig.shared" > ~/.gitconfig
  echo "Created new .gitconfig with shared config include"
fi

# shell setup - fish is primary, zsh as backup
echo $(brew --prefix)/bin/fish | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# dns privacy.
brew services start stubby
sudo brew services start dnscrypt-proxy
# shieldsup

# macos defaults
./macos.sh

# setup dock.
./dock-setup.sh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
fisher install brigand/fast-nvm-fish
nvm install lts/hydrogen
nvm use lts/hydrogen
