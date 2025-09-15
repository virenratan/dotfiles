#!/bin/zsh

# shellcheck source=nas.env
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
if [ ! -f "$SCRIPT_DIR/nas.env" ]; then
  echo "❌ Missing $SCRIPT_DIR/nas.env" >&2
  exit 1
fi
source "$SCRIPT_DIR/nas.env"

# restart plex on synology nas and notify of success/failure.
if "$NAS_SSH_BIN" -i "$NAS_SSH_KEY" ${(z)NAS_SSH_OPTS} "$NAS_SSH_TARGET" "sudo /usr/syno/bin/synopkg restart PlexMediaServer > /dev/null"; then
  terminal-notifier -title "Restart Plex on NAS" -message "Plex restarted successfully ✅"
  echo "✅ Plex restarted successfully"
else
  terminal-notifier -title "Restart Plex on NAS" -message "Failed to restart Plex ❌"
  echo "❌ Failed to restart Plex"
fi
