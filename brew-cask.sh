function installcask() {
  brew cask install "${@}" 2> /dev/null
}

function uninstallcask() {
  brew cask uninstall "${@}" 2> /dev/null
}

# install apps.
installcask 1password
installcask android-file-transfer
installcask atom
installcask bartender
installcask dropbox
installcask fantastical
installcask firefox
installcask google-chrome
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
installcask zeplin

# check for updates from the mac app store.
echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a
