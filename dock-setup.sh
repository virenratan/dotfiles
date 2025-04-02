#!/usr/bin/env bash

# wipe all app icons from the dock.
defaults write com.apple.dock persistent-apps -array

# manually add app icons to dock in preferred order.
dockutil --add '/System/Applications/Finder.app' --replacing 'Finder'
dockutil --add '/Applications/Google Chrome.app' --replacing 'Google Chrome' --after 'Finder'
dockutil --add '/Applications/Visual Studio Code.app' --replacing 'Visual Studio Code' --after 'Google Chrome'
dockutil --add '/System/Applications/Notes.app' --replacing 'Notes' --after 'Visual Studio Code'
dockutil --add '/System/Applications/Music.app' --replacing 'Music' --after 'Notes'
dockutil --add '/Applications/iTerm2.app' --replacing 'iTerm2' --after 'Music'
dockutil --add '/Applications/Docker.app' --replacing 'Docker' --after 'iTerm2'
dockutil --add '/Applications/Figma.app' --replacing 'Figma' --after 'Docker'
dockutil --add '/Applications/Slack.app' --replacing 'Slack' --after 'Figma'
dockutil --add '/System/Applications/iPhone Mirroring.app' --replacing 'iPhone Mirroring' --after 'Slack'

# restart dock to apply changes.
killall Dock
