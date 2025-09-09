#!/bin/zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# shellcheck source=nas.env
SCRIPT_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
if [ ! -f "$SCRIPT_DIR/nas.env" ]; then
  echo "❌ Missing $SCRIPT_DIR/nas.env" >&2
  exit 1
fi
source "$SCRIPT_DIR/nas.env"

NAS_IP="$NAS_HOST"
CHECK_DIRS=( "/Volumes/Media/Comics" "/Volumes/Media/Movies" "/Volumes/Media/Series" )
CONTAINERS=( mylar3 radarr sonarr )

# 1. check if the nas is reachable.
if ! ping -c 1 -W 1 $NAS_IP >/dev/null 2>&1; then
  echo "⚠️ NAS not reachable, skipping"
  exit 0
fi

# 2. check volumes exist locally.
for d in $CHECK_DIRS; do
  if [ ! -d "$d" ]; then
    echo "⚠️ Volume $d not mounted, skipping"
    exit 0
  fi
done

# 3. check the mounts inside of the containers.
NEED_RESTART=()
for c in $CONTAINERS; do
  if ! docker exec $c test -d /data/Comics >/dev/null 2>&1 \
     && ! docker exec $c test -d /data/Movies >/dev/null 2>&1 \
     && ! docker exec $c test -d /data/Series >/dev/null 2>&1; then
    NEED_RESTART+=($c)
  fi
done

# 4. restart if needed.
if [ ${#NEED_RESTART[@]} -eq 0 ]; then
  echo "✅ All containers see their mounts fine"
else
  echo "♻️ Restarting: ${NEED_RESTART[@]}"
  docker restart ${NEED_RESTART[@]}
fi
