# navigation.
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# utilities.
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end

# mv, rm, cp
alias mv 'command gmv --interactive --verbose'
alias rm 'command grm --interactive --verbose'
alias cp 'command gcp --interactive --verbose'

alias chmox='chmod +x'

alias cask='brew cask' # i <3 u cask
alias where=which # sometimes i forget

# typos.
alias brwe=brew
alias gti=git
alias yearn=yarn

alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

alias push="git push"

alias ag='ag --follow --hidden'

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

alias master="git checkout master"

# networking. ip address, dig, dns
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"
# wget sucks with certificates. Let's keep it simple.
alias wget="curl -O"

# recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# shortcuts.
alias c="code ."
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias g="git"
alias h="history"
alias hosts="sudo nano /etc/hosts"
alias j="jobs"
alias v="vim"
alias sb="source ~/.bash_profile"
alias o="open"
alias oo="open ."
alias q="exit"

# dns stuff.
alias shieldsup="sudo /usr/local/opt/stubby/sbin/stubby-setdns-macos.sh"
alias shieldsdown="sudo /usr/local/opt/stubby/sbin/stubby-setdns-macos.sh -r"

# file size
alias fs="stat -f \"%z bytes\""

alias push="git push"
alias undopush="git push -f origin HEAD^:master"

# enable aliases to be sudo’ed
alias sudo='sudo '

# stop ping after 5 requests
alias ping='ping -c 5'

# emptytrash written as a function
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor; npm-check -g -u"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-document'
