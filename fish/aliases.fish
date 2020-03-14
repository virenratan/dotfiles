# navigation.
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# utilities.
function g         ; git $argv ; end
function grep      ; command grep --color=auto $argv ; end
function egrep     ; command egrep --color=auto $argv ; end

alias mv 'command gmv --interactive --verbose'
alias rm 'command grm --interactive --verbose'
alias cp 'command gcp --interactive --verbose'

alias chmox 'chmod +x'

# shortcuts.
alias vs c
alias c  'code .'
alias d  'cd ~/Downloads'
alias dt 'cd ~/Desktop'
alias p  'cd ~/Projects'
alias j  'jobs'
alias o  'open .'
alias q  'exit'
alias g  git
alias h  history
alias hosts "sudo $EDITOR /etc/hosts"
alias please sudo
alias plz please
alias fs "stat -f \"%z bytes\"" # file size.
alias where 'which'

# replacements.
alias cat  bat
alias kill fkill
alias top  vtop

# homebrew 🍺.
alias cask 'brew cask'
alias upgrade 'yarn global upgrade && brew upgrade && brew cask upgrade && brew cleanup && sudo softwareupdate -i -a'

# git.
alias push 'git push'
alias undopush 'git push -f origin HEAD^:master'
alias master 'git checkout master'

# dns over https.
alias shieldsup 'sudo /usr/local/opt/stubby/sbin/stubby-setdns-macos.sh'
alias shieldsdown 'sudo /usr/local/opt/stubby/sbin/stubby-setdns-macos.sh -r'

# enable aliases to be sudo’ed.
alias sudo 'sudo '

# network.
alias ping 'ping -c 5' # stop ping after 5 requests.
alias localip 'ipconfig getifaddr en0'
alias ip 'dig +short myip.opendns.com @resolver1.opendns.com'
alias dig 'dig +nocmd any +multiline +noall +answer'

# recursively delete `.DS_Store` files.
alias cleanup_ds "find . -name '*.DS_Store' -type f -ls -delete"
# clean up LaunchServices to remove duplicates in the “Open With” menu.
alias cleanup_ls '/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

alias diskspace 'df -P -kHl'

# empty_trash written as a function.
alias empty_trash 'sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'

# typos.
alias brwe brew
alias gti git
alias yearn yarn
