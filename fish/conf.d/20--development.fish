# development tools (nvm, pyenv, etc.)

# pyenv.
set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

# nvm.
set -gx NVM_DIR ~/.nvm
set -gx nvm_default_version lts/hydrogen

if status is-interactive; and test -f $NVM_DIR/nvm.sh
    nvm use default --silent
end
