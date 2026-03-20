# development tools (nvm, pyenv, etc.)

# pyenv.
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

# fnm.
fnm env --use-on-cd --resolve-engines --shell fish | source
