export PATH="$HOME/bin:$PATH"

# add ssh passphrase to keychain on reboot.
ssh-add -K ~/.ssh/id_rsa 2> /dev/null

# load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,profile}; do
  [ -r "$file" ] && source "$file"
done
unset file

# case-insensitive globbing (used in pathname expansion).
shopt -s nocaseglob

# append to the bash history file, rather than overwriting it.
shopt -s histappend

# autocorrect typos in path names when using `cd`.
shopt -s cdspell

# enable some bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# add tab completion for ssh hostnames based on ~/.ssh/config, ignoring wildcards.
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# add tab completion for `defaults read|write NSGlobalDomain`
# you could just use `-g` instead, but i like being explicit.
complete -W "NSGlobalDomain" defaults

# add `killall` tab completion for common apps.
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# if possible, add tab completion for many more commands.
[ -f /etc/bash_completion ] && source /etc/bash_completion

# android stuff.
# export ANDROID_HOME=~/Library/Android/sdk
# export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
# export GRADLE_HOME=/usr/local/opt/gradle
# export PATH=$PATH:~/.nexustools
# export PATH="$PATH:$ANDROID_HOME/platform-tools/:$ANDROID_HOME/tools/:$ANDROID_HOME/build-tools/25.0.3/"

# fastlane stuff.
# export PATH="$HOME/.fastlane/bin:$PATH"
# export PATH="$HOME/.fastlane/bin/fastlane_lib:$PATH"

# nvm stuff..
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

if [[ $(brew ls --versions nvm) ]]
then
    export NVM_DIR="$HOME/.nvm"
    . "$(brew --prefix nvm)/nvm.sh"
fi

# ruby stuff.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # load rvm into a shell session *as a function*

# ec2 cli stuff.
# export PATH=$PATH:$EC2_HOME/bin
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
# export EC2_HOME=~/.ec2
# export EC2_URL=https://eu-west-1.ec2.amazonaws.com
# export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
# export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export PATH="$PATH:/usr/local/opt/curl/bin"

# gpg2 stuff.
export GPG_TTY=`tty`
