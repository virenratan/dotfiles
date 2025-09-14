#!/bin/zsh

# set PATH to ensure cron can find all commands.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') $*"
}

# shellcheck source=nas.env
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
if [ ! -f "$SCRIPT_DIR/nas.env" ]; then
  log "❌ Missing $SCRIPT_DIR/nas.env" >&2
  exit 1
fi
source "$SCRIPT_DIR/nas.env"

start_time=$(date +%s)

if ping -c 1 -W 1 "$NAS_HOST" > /dev/null 2>&1; then
  log "🧹 NAS cleanup (delete mode)..."
  if "$NAS_SSH_BIN" -i "$NAS_SSH_KEY" $NAS_SSH_OPTS "$NAS_SSH_TARGET" "sudo find /volume2/Media/Movies /volume2/Media/Series \
      \( -type f -name '.smbdelete*' -delete -print \) -o \
      \( -type d -empty -delete -print \)"; then
    log "✅ Cleanup completed (took $(( $(date +%s) - start_time ))s)"
  else
    log "❌ Cleanup failed"
  fi
else
  log "⚠️ NAS not reachable, skipping cleanup."
fi
