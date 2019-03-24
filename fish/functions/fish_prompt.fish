function fish_prompt
	# Store the exit code of the last command
	set -g sf_exit_code $status
	set -g SPACEFISH_VERSION 2.4.0

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_PROMPT_ADD_NEWLINE true
	__sf_util_set_default SPACEFISH_PROMPT_FIRST_PREFIX_SHOW false
	__sf_util_set_default SPACEFISH_PROMPT_PREFIXES_SHOW true
	__sf_util_set_default SPACEFISH_PROMPT_SUFFIXES_SHOW true
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_PREFIX "via "
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_SUFFIX " "
	__sf_util_set_default SPACEFISH_PROMPT_ORDER time user dir host git package node ruby golang php rust haskell julia docker aws venv conda pyenv dotnet kubecontext exec_time line_sep battery vi_mode jobs exit_code char

	# ------------------------------------------------------------------------------
	# Sections
	# ------------------------------------------------------------------------------

	# Keep track of whether the prompt has already been opened
	set -g sf_prompt_opened $SPACEFISH_PROMPT_FIRST_PREFIX_SHOW

	if test "$SPACEFISH_PROMPT_ADD_NEWLINE" = "true"
		echo
	end

	for i in $SPACEFISH_PROMPT_ORDER
		eval __sf_section_$i
	end
	set_color normal
end

# wakatime for fish
#
# Add this to the fish_prompt function in
# ~/.config/fish/functions/fish_prompt.fish
# (or if it doesn't exist, create it).


# We've also included an example of how
# to determine the current project from the pwd.
# It'll only work without alterations if
# you happen to keep all your projects in
# ~/Sites/ on a Mac, but it's easy to modify

set -l project

if echo (pwd) | grep -qEi "^/Users/$USER/Projects/"
    set  project (echo (pwd) | sed "s#^/Users/$USER/Projects/\\([^/]*\\).*#\\1#")
else
    set  project "Terminal"
end

wakatime --write --plugin "fish-wakatime/0.0.1" --entity-type app --project "$project" --entity (echo $history[1] | cut -d ' ' -f1) 2>&1 > /dev/null&
