function installcask() {
  brew cask install "${@}" 2> /dev/null
}

# install apps.
installcask 1password
installcask abstract
installcask atom
installcask bartender
installcask craftmanager
installcask dropbox
installcask figma
installcask firefox
installcask google-chrome
installcask istat-menus
installcask iterm2
installcask itsycal
installcask micro-snitch
installcask postman
installcask sketch
installcask slack
installcask spotify
installcask the-unarchiver
installcask tower
installcask tripmode
installcask visual-studio-code
installcask vlc
installcask zeplin

# install apps from mac app store.
mas install 587512244  # kaleidoscope
mas install 441258766  # magnet
mas install 1084713122 # markoff
mas install 557168941  # tweetbot

# only for home computers.
# installcask battle-net
# installcask evernote
# installcask filebot
# installcask nordvpn
# installcask steam
# mas install 504544917 # clear
# mas install 975937182 # fantastical

# check for updates from the mac app store.
echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a
