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
installcask fantastical
installcask figma
installcask firefox
installcask google-chrome
installcask istat-menus
installcask iterm2
installcask itsycal
installcask kaleidoscope
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

# only for home computers.
# installcask battle-net
# installcask evernote
# installcask filebot
# installcask nordvpn
# installcask steam

# check for updates from the mac app store.
echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a
