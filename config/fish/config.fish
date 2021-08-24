# Set up homebrew
set -x PATH $PATH /usr/local/Cellar
set -x PATH $PATH /usr/local/opt/llvm/bin/

# Set up golang stuff
set -g -x GOPATH $HOME/go
set -x GOROOT /usr/local/opt/go/libexec

set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $GOROOT/bin

# Set up Rust
set -x PATH $PATH ~/.cargo/bin

# Set up Flutter
set -x PATH $PATH ~/Documents/flutter/bin

# Set up Old Java
set -x PATH $PATH ~/Downloads/apache-maven-3.5.3/bin

set -x SLEDGE_BIN /Users/gianfranco.biondi/.sledge/bin
set -x PATH $PATH $SLEDGE_BIN

# Set Less preferences
set -x LESS '-R -C -M -I -j 10 -# 4'

fish_vi_key_bindings
set -U EDITOR nvim

# FZF Plugin Preferences
set -U FZF_COMPLETE 3
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_FIND_FILE_OPTS "--reverse --inline-info"
set -U FZF_FIND_FILE_COMMAND "rg --files"
set -U FZF_OPEN_COMMAND "rg --files"
set -U FZF_ENABLE_OPEN_PREVIEW 0
set -U FZF_PREVIEW_FILE_CMD "head -n 10"
set -U FZF_PREVIEW_DIR_CMD "lsd -1"

set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
