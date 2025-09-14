#!/bin/zsh

# shellcheck source=nas.env
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
if [ ! -f "$SCRIPT_DIR/nas.env" ]; then
  echo "❌ Missing $SCRIPT_DIR/nas.env" >&2
  exit 1
fi
source "$SCRIPT_DIR/nas.env"

# get plex package status (expects jq on nas)
plex_state=$("$NAS_SSH_BIN" -i "$NAS_SSH_KEY" $NAS_SSH_OPTS "$NAS_SSH_TARGET" "sudo /usr/syno/bin/synopkg status PlexMediaServer | jq -r .status" 2>/dev/null)

# get last restart time from plex media server logs.
last_restart=$("$NAS_SSH_BIN" -i "$NAS_SSH_KEY" $NAS_SSH_OPTS "$NAS_SSH_TARGET" "grep 'Plex Media Server v' '/volume1/PlexMediaServer/AppData/Plex Media Server/Logs/Plex Media Server.log' | tail -1 | awk '{month=\$1; day=\$2; gsub(/,/, \"\", day); year=\$3; time=\$4; split(time, tp, \".\"); split(tp[1], hms, \":\"); h=hms[1]+0; m=hms[2]; s=hms[3]; ampm=\"am\"; if (h==0){h=12} else if (h==12){ampm=\"pm\"} else if (h>12){h=h-12; ampm=\"pm\"}; printf \"%s %s, %s %d:%s:%s %s\\n\", month, day, year, h, m, s, ampm }'" 2>/dev/null)

if [[ "$plex_state" == "running" ]]; then
  echo "✅ Plex is running"
  if [[ -n "$last_restart" ]]; then
    echo "   Last restarted at: $last_restart"
  fi
else
  echo "❌ Plex is not running"
fi
