# app replacements.
abbr -a cat 'bat -P'
abbr -a kill 'fkill'
abbr -a top 'vtop'

# homebrew.
abbr -a cask 'brew cask'
abbr -a upgrade 'yarn global upgrade && brew upgrade && mas upgrade'

# plex on synology nas.
function plex-restart
    ~/Library/Mobile\ Documents/com~apple~CloudDocs/scripts/plex-restart.sh
    plex-status
end
function plex-status
    set plex_state (ssh viren@192.168.1.135 "sudo /usr/syno/bin/synopkg status PlexMediaServer | jq -r .status")
    set now (date "+%Y-%m-%d %H:%M:%S")
    set last_restart (ssh viren@192.168.1.135 "grep 'Plex Media Server v' '/volume1/PlexMediaServer/AppData/Plex Media Server/Logs/Plex Media Server.log' | tail -1 | cut -d' ' -f1-4")

    if test "$plex_state" = "running"
        echo "✅ Plex is running"
        echo "   Last restarted at: $last_restart"
    else
        echo "❌ Plex is not running"
    end
end


# typos
abbr -a brwe 'brew'
abbr -a gti 'git'
abbr -a yearn 'yarn'
