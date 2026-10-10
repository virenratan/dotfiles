function fish_greeting
end
set default_user $USER
set default_machine (hostname -s)
set -gx EDITOR nano
test -e $HOME/.extra.fish; and source $HOME/.extra.fish

# majority of configuration is under conf.d.

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
