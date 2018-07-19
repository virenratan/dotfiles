# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Larger bash history (default is 500)
export HISTFILESIZE=10000
export HISTSIZE=10000

# Add path for Android SDK
# export PATH="$PATH:$ANDROID_HOME/platform-tools/:$ANDROID_HOME/tools/:$ANDROID_HOME/build-tools/25.0.3/"

# nvm initialisation
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# add ssh passphrase to keychain on reboot.
ssh-add -K ~/.ssh/id_rsa 2> /dev/null

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,profile}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Android stuff.
# export ANDROID_HOME=~/Library/Android/sdk
# export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
# export GRADLE_HOME=/usr/local/opt/gradle
# export PATH=$PATH:~/.nexustools

# Fastlane stuff.
# export PATH="$HOME/.fastlane/bin:$PATH"
# export PATH="/usr/local/bin:$PATH"
# export PATH="$HOME/.fastlane/bin/fastlane_lib:$PATH"

# node stuff.
export NVM_DIR="$HOME/.nvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# ec2 command line tools
# export PATH=$PATH:$EC2_HOME/bin
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
# export EC2_HOME=~/.ec2
# export EC2_URL=https://eu-west-1.ec2.amazonaws.com
# export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
# export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
