# dockutil - https://formulae.brew.sh/formula/dockutil
curl -k -o /usr/local/bin/dockutil https://raw.githubusercontent.com/kcrawford/dockutil/master/scripts/dockutil
chmod a+x /usr/local/bin/dockutil
hash -r

# wipe all app icons from the dock.
defaults write com.apple.dock persistent-apps -array

# manually add app icons to dock in preferred order.
dockutil --add  '/Applications/Google Chrome.app' --replacing 'Google Chrome'
dockutil --add  '/Applications/Atom.app' --replacing 'Atom' --after 'Google Chrome'
dockutil --add  '/Applications/Visual Studio Code.app' --replacing 'Visual Studio Code' --after 'Atom'
dockutil --add  '/Applications/Tower.app' --replacing 'Tower' --after 'Visual Studio Code'
dockutil --add  '/Applications/iTerm.app' --replacing 'iTerm' --after 'Tower'
dockutil --add  '/Applications/Abstract.app' --replacing 'Abstract' --after 'iTerm'
dockutil --add  '/Applications/Sketch.app' --replacing 'Sketch' --after 'Abstract'
dockutil --add  '/Applications/Zeplin.app' --replacing 'Zeplin' --after 'Sketch'
dockutil --add  '/Applications/Clear.app' --replacing 'Clear' --after 'Zeplin'
dockutil --add  '/Applications/Slack.app' --replacing 'Slack' --after 'Clear'
dockutil --add  '/Applications/Tweetbot.app' --replacing 'Tweetbot' --after 'Slack'
dockutil --add  '/Applications/Spotify.app' --replacing 'Spotify' --after 'Tweetbot'
