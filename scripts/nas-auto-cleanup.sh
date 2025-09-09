#!/bin/zsh

# set PATH to ensure cron can find all commands.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# shellcheck source=nas.env
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
if [ ! -f "$SCRIPT_DIR/nas.env" ]; then
  echo "❌ Missing $SCRIPT_DIR/nas.env" >&2
  exit 1
fi
source "$SCRIPT_DIR/nas.env"

start_time=$(date +%s)

if ping -c 1 -W 1 "$NAS_HOST" > /dev/null 2>&1; then
  echo "🧹 NAS cleanup (delete mode)..."
  if /usr/bin/ssh -i $HOME/.ssh/nas-cleanup "$NAS_SSH_TARGET" "sudo find /volume2/Media/Movies /volume2/Media/Series \
      \( -type f -name '.smbdelete*' -delete -print \) -o \
      \( -type d -empty -delete -print \)"; then
    echo "✅ Cleanup completed (took $(( $(date +%s) - start_time ))s)"
  else
    echo "❌ Cleanup failed"
  fi
else
  echo "⚠️ NAS not reachable, skipping cleanup."
fi
