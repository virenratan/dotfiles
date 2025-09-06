#!/bin/zsh

# get plex package status (expects jq on nas)
plex_state=$(ssh viren@192.168.1.135 "sudo /usr/syno/bin/synopkg status PlexMediaServer | jq -r .status" 2>/dev/null)

# get last restart time from plex media server logs.
last_restart=$(ssh viren@192.168.1.135 "grep 'Plex Media Server v' '/volume1/PlexMediaServer/AppData/Plex Media Server/Logs/Plex Media Server.log' | tail -1 | cut -d' ' -f1-4" 2>/dev/null)

if [[ "$plex_state" == "running" ]]; then
  echo "✅ Plex is running"
  if [[ -n "$last_restart" ]]; then
    echo "   Last restarted at: $last_restart"
  fi
else
  echo "❌ Plex is not running"
fi
