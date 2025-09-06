# app replacements.
abbr -a cat 'bat -P'
abbr -a kill 'fkill'
abbr -a top 'vtop'

# homebrew.
abbr -a cask 'brew cask'
abbr -a upgrade 'yarn global upgrade && brew upgrade && mas upgrade'

# nas
alias plex-restart "$HOME/Library/Mobile Documents/com~apple~CloudDocs/scripts/plex-restart.sh"
function plex-status
    set plex_state (ssh viren@192.168.1.135 "sudo /usr/syno/bin/synopkg status PlexMediaServer | jq -r .status")
    if test "$plex_state" = "running"
        echo "✅ Plex is running"
    else
        echo "❌ Plex is not running"
    end
end


# typos
abbr -a brwe 'brew'
abbr -a gti 'git'
abbr -a yearn 'yarn'
