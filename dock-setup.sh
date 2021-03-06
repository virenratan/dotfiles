#!/usr/bin/env bash

# wipe all app icons from the dock.
defaults write com.apple.dock persistent-apps -array

# manually add app icons to dock in preferred order.
dockutil --add  '/Applications/Google Chrome.app' --replacing 'Google Chrome'
dockutil --add  '/Applications/Firefox.app' --replacing 'Firefox' --after 'Google Chrome'
dockutil --add  '/Applications/Safari.app' --replacing 'Safari' --after 'Firefox'
dockutil --add  '/Applications/Visual Studio Code.app' --replacing 'Visual Studio Code' --after 'Safari'
dockutil --add  '/Applications/Tower.app' --replacing 'Tower' --after 'Visual Studio Code'
dockutil --add  '/Applications/iTerm.app' --replacing 'iTerm' --after 'Tower'
dockutil --add  '/Applications/Figma.app' --replacing 'Figma' --after 'iTerm'
dockutil --add  '/Applications/iA Writer.app' --replacing 'iA Writer' --after 'Figma'
dockutil --add  '/Applications/Clear.app' --replacing 'Clear' --after 'iA Writer'
dockutil --add  '/Applications/Slack.app' --replacing 'Slack' --after 'Clear'
dockutil --add  '/Applications/Tweetbot.app' --replacing 'Tweetbot' --after 'Slack'
dockutil --add  '/Applications/Spotify.app' --replacing 'Spotify' --after 'Tweetbot'
