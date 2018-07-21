# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/Projects/dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Projects

DEFAULT_USER=viren
ZSH_THEME=agnoster

# use .extra for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
if [[ -a ~/.extra ]]
then
  source ~/.extra
fi

# all of our zsh files
typeset -U config_files
config_files=($ZSH/zsh/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

unset config_files

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

fpath=(/usr/local/share/zsh-completions $fpath)

# Add plugins
plugins=(git rails rails3 ruby capistrano bundler heroku rake rvm autojump command-not-found python pip github gnu-utils history-substring-search zsh-syntax-highlighting)
