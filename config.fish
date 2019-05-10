# set the workspace path
set -g -x GOPATH $HOME/go
set -x GOROOT /usr/local/opt/go/libexec

set -x PATH $PATH /usr/local/Cellar
# add the go bin path to be able to execute our programs
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $GOROOT/bin

#set -x LESS '-C -M -I -j 10 -# 4'
set -x LESS '-R -C -M -I -j 10 -# 4'

fish_vi_key_bindings

. ~/perl5/perlbrew/etc/perlbrew.fish

#set FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# For jet.com/Phaser stuff
set -x PATH $PATH "/usr/local/openresty/nginx/sbin"
set -x PATH $PATH "/usr/local/openresty/bin"
set -x PATH $PATH "/usr/local/openresty/luajit/bin"

alias luajit='rlwrap luajit'

set -U FZF_COMPLETE 3
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_FIND_FILE_OPTS "--reverse --inline-info"
set -U FZF_TMUX 0
#set -U FZF_FIND_FILE_COMMAND "rg --files"
#set -U FZF_OPEN_COMMAND "rg --files"
set -U FZF_FIND_FILE_COMMAND "fd --type f --hidden --follow --exclude .git . \$dir"
set -U FZF_OPEN_COMMAND "fd --type f --hidden --follow --exclude .git . \$dir"
#set -U FZF_OPEN_COMMAND "fd --type f . \$dir"

set -U FZF_ENABLE_OPEN_PREVIEW 0

set -U EDITOR nvim


set -x PATH $PATH "/Users/gianfranco.biondi/Documents/flutter/bin"
