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
bindkey -v
export KEYTIMEOUT=1

#Speed up cursor
defaults write NSGlobalDomain KeyRepeat -int 0

#HOMEBREW
export PATH=/usr/local/bin:$PATH

# Golang Stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOROOT=/usr/local/opt/go/libexec

#Stuff
unsetopt CORRECT
expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_NAME_DIRS

setopt ZLE

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

#direnv
#eval "$(direnv hook $0)"
