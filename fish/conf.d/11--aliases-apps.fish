# app replacements.
abbr -a cat 'bat -P'
abbr -a top 'btop'

# synology nas.
alias nas-cleanup="$HOME/scripts/nas-cleanup.sh"
alias nas-docker-remount="$HOME/scripts/nas-docker-remount.sh"

# plex on synology nas.
function plex-restart
  $HOME/scripts/plex-restart.sh
  plex-status
end
alias plex-status="$HOME/scripts/plex-status.sh"
