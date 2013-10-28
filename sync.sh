#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" \
    --exclude "bin/" --exclude "init" --exclude "config" --exclude "dotfiles.sublime-project" \
		--exclude "dotfiles.sublime-workspace" --exclude "license" --exclude "src/" --exclude "z/" \
		--exclude "README.md" --exclude "deps.sh" -av --no-perms . ~
	source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile