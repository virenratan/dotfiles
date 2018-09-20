# install apps.
brew cask install 1password
brew cask install abstract
brew cask install atom
brew cask install bartender
brew cask install cakebrew
brew cask install craftmanager
brew cask install dropbox
brew cask install figma
brew cask install firefox
brew cask install google-chrome
brew cask install istat-menus
brew cask install iterm2
brew cask install itsycal
brew cask install micro-snitch
brew cask install postman
brew cask install sketch
brew cask install slack
brew cask install spotify
brew cask install the-unarchiver
brew cask install tower
brew cask install tripmode
brew cask install visual-studio-code
brew cask install vlc
brew cask install zeplin

# install some fonts.
brew cask install font-droid-sans-mono-for-powerline
brew cask install font-fira-code
brew cask install font-open-sans

# install apps from mac app store.
mas install 587512244  # kaleidoscope
mas install 441258766  # magnet
mas install 1084713122 # markoff
mas install 615956269  # pdf reader
mas install 557168941  # tweetbot

# only for home computers.
# brew cask install battle-net
# brew cask install filebot
# brew cask install nordvpn
# brew cask install steam
# mas install 504544917 # clear
# mas install 975937182 # fantastical

# check for updates from the mac app store.
echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a
