# Minimal zsh configuration as backup for fish shell

# Load colors
autoload -U colors && colors

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Basic auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Prompt
PROMPT='%F{green}%~%f $(git_prompt_info)
%F{blue}❯%f '

# Git info for prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f'

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Environment variables
export EDITOR=nano
export GPG_TTY=$(tty)

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Path
if [[ $(uname -m) == "arm64" ]]; then
  # Apple Silicon
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
else
  # Intel
  export PATH="/usr/local/sbin:/usr/local/opt/curl/bin:$PATH"
fi
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Aliases
alias g="git"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias ls="ls -G"
alias la="ls -laG"
alias ..="cd .."
alias ...="cd ../.."
alias dt="cd ~/Desktop"
alias d="cd ~/Downloads"
alias p="cd ~/Projects"
alias o="open ."
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias cleanup_ds="find . -name '*.DS_Store' -type f -ls -delete"

# Shell switching
alias switch_to_fish='chsh -s "$(brew --prefix)/bin/fish"'

eval "$(starship init zsh)"
