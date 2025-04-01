# navigation.
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# utilities.
function g         ; git $argv ; end
function grep      ; command grep --color=auto $argv ; end
function egrep     ; command egrep --color=auto $argv ; end

# these require 'brew install coreutils' to have been successful.
if not command -q grm; or not command -q gmv; or not command -q gcp
    echo "Warning: GNU coreutils not found. Please run: brew install coreutils"
end
alias mv 'command gmv --interactive --verbose'
alias rm 'command grm --interactive --verbose'
alias cp 'command gcp --interactive --verbose'

abbr -a chmox 'chmod +x'

# shortcuts
abbr -a vs 'c'
abbr -a c 'code .'
abbr -a d 'cd ~/Downloads'
abbr -a dt 'cd ~/Desktop'
abbr -a p 'cd ~/Projects'
abbr -a j 'jobs'
abbr -a o 'open .'
abbr -a q 'exit'
abbr -a g 'git'
abbr -a h 'history'
abbr -a please 'sudo'
abbr -a plz 'please'
abbr -a fs "stat -f \"%z bytes\""
abbr -a where 'which'

# replacements
abbr -a cat 'bat'
abbr -a kill 'fkill'
abbr -a top 'vtop'

# homebrew
abbr -a cask 'brew cask'
abbr -a upgrade 'yarn global upgrade && brew upgrade'

# git
abbr -a push 'git push'
abbr -a undopush 'git push -f origin HEAD^:master'
abbr -a master 'git checkout master'

# dns over https
abbr -a shieldsup 'sudo /usr/local/opt/stubby/sbin/stubby-setdns-macos.sh'
abbr -a shieldsdown 'sudo /usr/local/opt/stubby/sbin/stubby-setdns-macos.sh -r'

# enable aliases to be sudo'ed
abbr -a sudo 'sudo '

# network
abbr -a ping 'ping -c 5'
abbr -a localip 'ipconfig getifaddr en0'
abbr -a ip 'dig +short myip.opendns.com @resolver1.opendns.com'
abbr -a dig 'dig +nocmd any +multiline +noall +answer'

# cleanup
abbr -a cleanup_ds "find . -name '*.DS_Store' -type f -ls -delete"
abbr -a cleanup_ls '/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

abbr -a diskspace 'df -P -kHl'
abbr -a empty_trash 'sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'

# typos
abbr -a brwe 'brew'
abbr -a gti 'git'
abbr -a yearn 'yarn'

# switch shell to bash
abbr -a change_shell 'chsh -s (brew --prefix)/bin/bash'
