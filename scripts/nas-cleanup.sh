#!/bin/zsh

# cleanup junk files (like .smbdelete*) and empty dirs from synology nas media folders.

# shellcheck source=nas.env
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
if [ ! -f "$SCRIPT_DIR/nas.env" ]; then
  echo "❌ Missing $SCRIPT_DIR/nas.env" >&2
  exit 1
fi
source "$SCRIPT_DIR/nas.env"

start_time=$(date +%s)
MODE="delete"

if [[ "$1" == "--list" ]]; then
  MODE="list"
fi

echo "🧹 NAS cleanup ($MODE mode)..."

if [[ "$MODE" == "list" ]]; then
  "$NAS_SSH_BIN" -i "$NAS_SSH_KEY" ${(z)NAS_SSH_OPTS} "$NAS_SSH_TARGET" "find /volume2/Media/Movies /volume2/Media/Series \
    -type f -name '.smbdelete*' -print -o -type d -empty -print"
else
  "$NAS_SSH_BIN" -i "$NAS_SSH_KEY" ${(z)NAS_SSH_OPTS} "$NAS_SSH_TARGET" "sudo find /volume2/Media/Movies /volume2/Media/Series \
    \( -type f -name '.smbdelete*' -delete -print \) -o \
    \( -type d -empty -delete -print \)"
fi

if [[ $? -eq 0 ]]; then
  end_time=$(date +%s)
  elapsed=$(( end_time - start_time ))

  if [[ "$MODE" == "list" ]]; then
    terminal-notifier -title "NAS Housekeeping" -message "Listed junk & empty dirs ✅"
    echo "✅ Listed junk & empty dirs (took ${elapsed}s)"
  else
    terminal-notifier -title "NAS Housekeeping" -message "Cleanup completed ✅"
    echo "✅ Cleanup completed (took ${elapsed}s)"
  fi
else
  terminal-notifier -title "NAS Housekeeping" -message "Cleanup failed ❌"
  echo "❌ Cleanup failed"
fi
