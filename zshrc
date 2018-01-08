#zmodload zsh/zprof

# Zplug
# Check if zplug is installed

export ZPLUG_HOME=~/.zplug
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "b4b4r07/zsh-vimode-visual", defer:3

# Prezto modules
zplug 'modules/environment', from:prezto, defer:0
zplug 'modules/directory', from:prezto, defer:1
zplug 'modules/editor', from:prezto, defer:1
zplug 'modules/history', from:prezto, defer:1
zplug 'modules/git', from:prezto, defer:0
zplug 'modules/spectrum', from:prezto, defer:1
zplug 'modules/utility', from:prezto, defer:1
zplug 'modules/syntax-highlighting', from:prezto, defer:2
zplug 'modules/history-substring-search', from:prezto, defer:3
zplug 'modules/completions', from:prezto, defer:3

zplug mafredri/zsh-async, from:github, defer:0
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Prezto configuration options
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:*:*' case-sensitive 'no'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:tmux:iterm' integrate 'yes'
zstyle ':prezto:module:syntax-highlighting' color 'yes'
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'cursor' \
  'root'

zplug load
export PATH=$HOME/.zplug/bin:$PATH


#Speed Up Cursor
#defaults write NSGlobalDomain KeyRepeat -int 0
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# -----------------
# -- ZSH Options --
# -----------------
#setopt extended_glob     # save each command's beginning timestamp and duration to the history file
setopt list_ambiguous
#setopt auto_menu
setopt chase_links

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';
export JOBS=max # tell npm to install concurrently
export EDITOR=vim
export VISUAL=vim

# specify autocompletion settings
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)(CVS|.svn|.git)'
zstyle ':completion:*:($EDITOR|v|nvim|gvim|vim|vi):*' ignored-patterns '*.(o|a|so|aux|dvi|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps|eps|pyc|egg-info)'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
# zsh-history-substring-search
if zplug check "zsh-users/zsh-history-substring-search"; then
  zmodload zsh/terminfo
  [ -n "${terminfo[kcuu1]}" ] && bindkey "${terminfo[kcuu1]}" history-substring-search-up
  [ -n "${terminfo[kcud1]}" ] && bindkey "${terminfo[kcud1]}" history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi

# Use a local zshrc, if exists
if [[ -f "$HOME/zshrc.local" ]]; then
  source "$HOME/zshrc.local"
fi

# Ignore gitignore with fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# Customize to your needs...
bindkey -v
export KEYTIMEOUT=1

# VirtualEnvWrapper
#export WORKON_HOME=~/Envs
#source /usr/local/bin/virtualenvwrapper.sh

#Stuff
#setopt AUTO_CD
#setopt AUTO_PUSHD
#setopt AUTO_NAME_DIRS
#setopt IGNORE_EOF
## If I could disable Ctrl-s completely I would!
#setopt NO_FLOW_CONTROL
## Keep echo "station" > station from clobbering station
#setopt NO_CLOBBER
## Case insensitive globbing
#setopt GLOB_COMPLETE
#setopt NO_CASE_GLOB
## Be Reasonable!
#setopt NUMERIC_GLOB_SORT
## I don't know why I never set this before.
#setopt EXTENDED_GLOB
#setopt PUSHD_MINUS

#setopt ZLE
#unsetopt CORRECT
# expand-or-complete-with-dots() {
#  echo -n "\e[31m......\e[0m"
#  zle expand-or-complete
#  zle redisplay
#}
#zle -N expand-or-complete-with-dots
#bindkey "^I" expand-or-complete-with-dots


# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

#direnv
eval "$(direnv hook zsh)"

# Kubernetes
export EDITOR=nvim
#if [[ -x "$(command -v kubectl)" ]]; then
#  source <(kubectl completion zsh)
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
