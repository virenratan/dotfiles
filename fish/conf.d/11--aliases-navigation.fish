function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function ......; cd ../../../../.. ; end

abbr -a dt      "cd $HOME/Desktop"
abbr -a d       "cd $HOME/Downloads"
abbr -a p       "cd $HOME/Projects"
abbr -a icloud  "cd $HOME/Library/Mobile\ Documents/com~apple~CloudDocs"

# smarter cd: `z <partial-name>`, `zi` for interactive pick.
__source_cached_init zoxide init fish
