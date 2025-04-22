starship init fish | source

# https://iterm2.com/documentation-shell-integration.html
test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish
functions -q iterm2_prompt_mark; and iterm2_prompt_mark
