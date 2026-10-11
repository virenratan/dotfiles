# a cold first prompt can blow past scan_timeout. the prompt still renders, so skip the warning.
set -gx STARSHIP_LOG error
__source_cached_init starship init fish --print-full-init

# only load iterm2 shell integration when actually running in iterm2.
# https://iterm2.com/documentation-shell-integration.html
if string match -q "iTerm*" -- $TERM_PROGRAM
    test -e $HOME/.iterm2_shell_integration.fish; and source $HOME/.iterm2_shell_integration.fish
    functions -q iterm2_prompt_mark; and iterm2_prompt_mark
end
