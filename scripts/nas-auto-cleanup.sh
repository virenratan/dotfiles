#!/bin/zsh

# set PATH to ensure cron can find all commands.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

start_time=$(date +%s)

if ping -c 1 -W 1 192.168.1.135 > /dev/null 2>&1; then
  echo "🧹 NAS cleanup (delete mode)..."
  if /usr/bin/ssh -i $HOME/.ssh/nas-cleanup viren@192.168.1.135 "sudo find /volume2/Media/Movies /volume2/Media/Series \
      \( -type f -name '.smbdelete*' -delete -print \) -o \
      \( -type d -empty -delete -print \)"; then
    echo "✅ Cleanup completed (took $(( $(date +%s) - start_time ))s)"
  else
    echo "❌ Cleanup failed"
  fi
else
  echo "⚠️ NAS not reachable, skipping cleanup."
fi
