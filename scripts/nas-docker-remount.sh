#!/bin/zsh
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

# 1. skip if on battery power.
if pmset -g batt | grep -q "Battery Power"; then
  log "🔋 On battery power, skipping remount check"
  exit 0
fi

NAS_IP="$NAS_HOST"
MEDIA_ROOT="/Volumes/Media"

# each container maps to the single subdir it sees under both the host share
# and /data inside the container.
typeset -A MOUNTS
MOUNTS=( mylar3 Comics  radarr Films  sonarr Series )

# 2. check if the nas is reachable.
if ! ping -c 1 -W 1 $NAS_IP >/dev/null 2>&1; then
  log "⚠️ NAS not reachable, skipping"
  exit 0
fi

# 3. check the host share is mounted. if it is gone here, a container restart
# can't fix it, so skip.
for dir in ${(v)MOUNTS}; do
  if [ ! -d "$MEDIA_ROOT/$dir" ]; then
    log "⚠️ Volume $MEDIA_ROOT/$dir not mounted, skipping"
    exit 0
  fi
done

# 4. check each container actually reads its mount. a stale bind still resolves
# as a directory but shows up empty, so test for content not existence.
NEED_RESTART=()
for c in ${(k)MOUNTS}; do
  dir="${MOUNTS[$c]}"
  if ! docker exec "$c" sh -c "[ -n \"\$(ls -A /data/$dir 2>/dev/null)\" ]" >/dev/null 2>&1; then
    NEED_RESTART+=("$c")
  fi
done

# 5. restart if needed.
if [ ${#NEED_RESTART[@]} -eq 0 ]; then
  log "✅ All containers see their mounts fine"
else
  log "♻️ Restarting: ${NEED_RESTART[@]}"
  docker restart ${NEED_RESTART[@]}
fi
