# minimal core config.
function fish_greeting
end
set default_user $USER
set default_machine (hostname -s)
set -gx EDITOR code

# load custom files.
test -e $HOME/.extra.fish; and source $HOME/.extra.fish
test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish

# most configuration is in conf.d.
