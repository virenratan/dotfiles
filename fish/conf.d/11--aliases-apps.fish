# app replacements.
abbr -a cat 'bat -P'
abbr -a kill 'fkill'
abbr -a top 'vtop'

# synology nas.
alias nas-cleanup="$HOME/scripts/nas-cleanup.sh"

# plex on synology nas.
function plex-restart
  $HOME/scripts/plex-restart.sh
  plex-status
end
alias plex-status="$HOME/scripts/plex-status.sh"
