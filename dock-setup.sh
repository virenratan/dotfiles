#!/usr/bin/env bash

# wipe all app icons from the dock.
defaults write com.apple.dock persistent-apps -array

# manually add app icons to dock in preferred order.
dockutil --add '/System/Applications/Finder.app' --replacing 'Finder'
dockutil --add '/Applications/Google Chrome.app' --replacing 'Google Chrome' --after 'Finder'
dockutil --add '/Applications/Visual Studio Code.app' --replacing 'Visual Studio Code' --after 'Google Chrome'
dockutil --add '/System/Applications/Notes.app' --replacing 'Notes' --after 'Visual Studio Code'
dockutil --add '/Applications/Slack.app' --replacing 'Slack' --after 'Notes'
dockutil --add '/System/Applications/Music.app' --replacing 'Music' --after 'Slack'
dockutil --add '/Applications/Pocket Casts.app' --replacing 'Pocket Casts' --after 'Music'
dockutil --add '/Applications/iTerm2.app' --replacing 'iTerm2' --after 'Pocket Casts'
dockutil --add '/Applications/Figma.app' --replacing 'Figma' --after 'iTerm2'

# restart dock to apply changes.
killall Dock
