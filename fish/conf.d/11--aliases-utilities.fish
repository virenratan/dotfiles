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

# 🏃 shortcuts.
abbr -a c 'code .'
abbr -a cls 'clear'
abbr -a j 'jobs'
abbr -a o 'open .'
abbr -a q 'exit'
abbr -a h 'history'

abbr -a chmox 'chmod +x'
abbr -a fs "stat -f \"%z bytes\""
abbr -a where 'which'

# 🙏 be nice.
abbr -a please 'sudo'
abbr -a plz 'please'

# enable aliases to be sudo'ed
abbr -a sudo 'sudo '

# 🛜 network.
abbr -a ping 'ping -c 5'
abbr -a localip 'ipconfig getifaddr en0'
abbr -a ip 'dig +short myip.opendns.com @resolver1.opendns.com'
abbr -a dig 'dig +nocmd any +multiline +noall +answer'

# 🧹 housekeeping.
abbr -a cleanup_ds "find . -name '*.DS_Store' -type f -ls -delete"
abbr -a cleanup_ls '/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'
abbr -a diskspace 'df -P -kHl'
abbr -a empty_trash 'sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'

# 🔥 switch shell to native macOS zsh.
abbr -a change_shell 'chsh -s /bin/zsh'
