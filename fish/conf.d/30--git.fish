# gpg configuration.
set -x GPG_TTY (tty)

# git prompt configuration.
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream auto
set -g pure_git_untracked_dirty false

# git status characters.
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate 'red'
set __fish_git_prompt_color_upstream_ahead ffb90f
set __fish_git_prompt_color_upstream_behind blue

# aliases.
abbr -a gpr 'git pull --rebase origin main'
abbr -a gca 'git commit --amend --no-edit'
abbr -a gpf 'git push --force-with-lease'
abbr -a push 'git push'
abbr -a gitundo 'git push -f origin HEAD^:master'

# copilot.
abbr -a suggest 'gh copilot suggest'
