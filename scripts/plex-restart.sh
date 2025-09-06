#!/bin/zsh

# restart plex on synology nas and notify of success/failure.
if ssh viren@192.168.1.135 "sudo /usr/syno/bin/synopkg restart PlexMediaServer > /dev/null"; then
  terminal-notifier -title "Restart Plex on NAS" -message "Plex restarted successfully ✅"
  echo "✅ Plex restarted successfully"
else
  terminal-notifier -title "Restart Plex on NAS" -message "Failed to restart Plex ❌"
  echo "❌ Failed to restart Plex"
fi
