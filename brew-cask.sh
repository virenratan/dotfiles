# Install native apps
brew tap phinze/homebrew-cask
brew install brew-cask

function installcask() {
  brew cask install "${@}" 2> /dev/null
}

function uninstallcask() {
  brew cask uninstall "${@}" 2> /dev/null
}

installcask android-file-transfer
installcask atom
installcask bartender
installcask charles
installcask dropbox
installcask firefox
installcask github
installcask google-chrome
installcask imagealpha
installcask imageoptim
installcask istat-menus
installcask iterm2
installcask itsycal
installcask kaleidoscope
installcask postman
installcask sketch
installcask slack
installcask spotify
installcask the-unarchiver
installcask tower
installcask tripmode
# installcask transmission
installcask virtualbox
installcask visual-studio-code
installcask vlc
installcask zeplin
