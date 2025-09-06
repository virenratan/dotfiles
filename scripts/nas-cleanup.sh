#!/bin/zsh

# cleanup junk files (like .smbdelete*) and empty dirs from synology nas media folders.

start_time=$(date +%s)
MODE="delete"

if [[ "$1" == "--list" ]]; then
  MODE="list"
fi

echo "🧹 NAS cleanup ($MODE mode)..."

if [[ "$MODE" == "list" ]]; then
  ssh viren@192.168.1.135 "find /volume2/Media/Movies /volume2/Media/Series \
    -type f -name '.smbdelete*' -print -o -type d -empty -print"
else
  ssh viren@192.168.1.135 "sudo find /volume2/Media/Movies /volume2/Media/Series \
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
