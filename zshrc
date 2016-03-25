#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#HOMEBREW Preference
export PATH=/usr/local/bin:$PATH

#Golang Home
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

#Show/Hide Hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

unsetopt CORRECT                      
expand-or-complete-with-dots() {      
  echo -n "\e[31m......\e[0m"         
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

##Set GOPATH using GVP on cd to go project
#function cd() {
#  builtin cd $*
#  check_for_go
#}
#
#function check_for_go() {
#count=`ls -1 *.go >/dev/null | wc -l`
#if [[ $count != 0 ]];
#then 
#  #Found Go Files, run gvp
#  echo "Golang project Detected"
#  source gvp in
#fi 
#}
eval "$(direnv hook $0)"


#DOCKER STUFF
export DOCKER_CERT_PATH=/Users/gianbiondi/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export KEYTIMEOUT=1
