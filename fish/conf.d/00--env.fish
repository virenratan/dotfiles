# core environment variables.

# setup 1password ssh agent.
set -gx SSH_AUTH_SOCK ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# pure prompt configuration.
set pure_threshold_command_duration 1
set pure_separate_prompt_on_error true
set pure_begin_prompt_with_current_directory false
set -g pure_color_success (set_color green)
set -g pure_color_git_dirty (set_color cyan)
