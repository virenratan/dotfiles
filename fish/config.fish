# minimal core config.
set -e fish_greeting
set fish_greeting # hide welcome message.
set default_user $USER
set default_machine (hostname -s)
set -gx EDITOR nano

# load custom files.
test -e $HOME/.extra.fish; and source $HOME/.extra.fish
test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish

# most configuration is in conf.d.
