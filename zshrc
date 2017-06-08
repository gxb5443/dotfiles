zmodload zsh/zprof
#
# Executes commands at the start of an interactive session.
#
DEFAULT_USER=$USER
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_joined dir_writable_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time vcs
                                    background_jobs_joined time_joined)
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="clear"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="green"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="grey"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="clear"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="red"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_TIME_FOREGROUND="blue"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="blue"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='magenta'
POWERLEVEL9K_USER_DEFAULT_BACKGROUND='clear'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='cyan'
POWERLEVEL9K_USER_ROOT_BACKGROUND='clear'
POWERLEVEL9K_USER_ROOT_FOREGROUND='red'
POWERLEVEL9K_USER_ICON="\uf415" # 
POWERLEVEL9K_ROOT_ICON="\u26a1" # ⚡
POWERLEVEL9K_HOST_LOCAL_BACKGROUND='clear'
POWERLEVEL9K_HOST_LOCAL_FOREGROUND='cyan'
POWERLEVEL9K_HOST_REMOTE_BACKGROUND='clear'
POWERLEVEL9K_HOST_REMOTE_FOREGROUND='magenta'
POWERLEVEL9K_SSH_ICON="\uF489 "  # 
POWERLEVEL9K_OS_ICON_BACKGROUND="clear"
POWERLEVEL9K_OS_ICON_FOREGROUND="blue"

# Zplug
# Check if zplug is installed

export ZPLUG_HOME=~/.zplug
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

export _ZPLUG_PREZTO="zsh-users/prezto" # see https://github.com/zplug/zplug/issues/360

# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-completions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "zsh-users/zsh-history-substring-search"
#zplug "junegunn/fzf-bin", \
#  as:command, \
#  from:gh-r, \
#  rename-to:fzf, \
#  use:"*${(L)$(uname -s)}*amd64*"
#zplug "junegunn/fzf", \
#  as:command, \
#  use:"bin/fzf-tmux"
#zplug "junegunn/fzf", \
#  use:"shell/*.zsh"

# Tips for unused aliases
#zplug "djui/alias-tips"
#export ZSH_PLUGINS_ALIAS_TIPS_TEXT="💡  Try: "

# Prezto modules
zplug 'modules/environment', from:prezto
zplug 'modules/terminal', from:prezto
zplug 'modules/editor', from:prezto
zplug 'modules/history', from:prezto
zplug 'modules/directory', from:prezto
zplug 'modules/spectrum', from:prezto
zplug 'modules/utility', from:prezto
zplug 'modules/completion', from:prezto
zplug 'modules/git', from:prezto
zplug 'modules/osx', from:prezto
zplug 'modules/tmux', from:prezto

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, at:next

# Prezto configuration options
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:tmux:iterm' integrate 'no'

#if ! zplug check --verbose; then
#  printf "Install? [y/N]: "
#  if read -q; then
#      echo; zplug install
#  else
#      echo
#  fi
#fi

zplug load
export PATH=$HOME/.zplug/bin:$PATH


#Speed Up Cursor
#defaults write NSGlobalDomain KeyRepeat -int 0
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# -----------------
# -- ZSH Options --
# -----------------
setopt correct              # correct mistyped commands
setopt extended_glob     # save each command's beginning timestamp and duration to the history file
setopt list_ambiguous
setopt auto_menu
setopt chase_links

# Always enable colored `grep` output.
export GREP_OPTIONS='--color=auto';
export JOBS=max # tell npm to install concurrently
export EDITOR=vim
export VISUAL=vim

# specify autocompletion settings
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)(CVS|.svn|.git)'
zstyle ':completion:*:($EDITOR|v|nvim|gvim|vim|vi):*' ignored-patterns '*.(o|a|so|aux|dvi|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps|eps|pyc|egg-info)'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)
# zsh-history-substring-search
if zplug check "zsh-users/zsh-history-substring-search"; then
  zmodload zsh/terminfo
  [ -n "${terminfo[kcuu1]}" ] && bindkey "${terminfo[kcuu1]}" history-substring-search-up
  [ -n "${terminfo[kcud1]}" ] && bindkey "${terminfo[kcud1]}" history-substring-search-down
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
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

#HOMEBREW
export PATH=/usr/local/bin:$PATH

# Golang Stuff
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# VirtualEnvWrapper
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

#Vertica Stuff
export VERTICAINI=/usr/local/etc/vertica.ini
export ODBCINI=/usr/local/etc/odbc.ini

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
eval "$(direnv hook zsh)"

# Kubernetes
if [[ -x "$(command -v kubectl)" ]]; then
  source <(kubectl completion zsh)
fi
